// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async'; // For runZonedGuarded
import 'package:package_info_plus/package_info_plus.dart'; // For app version and build number
import 'dart:io'; // For device platform detection

Future setupErrorLogger() async {
  // Set up Flutter framework error handling
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details); // Optional: Shows error in debug mode
    // Send error to Supabase
    sendErrorToSupabase(
      details.exception.toString(),
      details.stack.toString(),
    );
  };

  // Set up Dart async uncaught error handling
  runZonedGuarded(
    () async {
      // Optional: Add any initialization logic here
    },
    (error, stackTrace) {
      // Send uncaught async errors to Supabase
      sendErrorToSupabase(
        error.toString(),
        stackTrace.toString(),
      );
    },
  );
}

Future sendErrorToSupabase(String errorMessage, String errorStackTrace) async {
  try {
    // Retrieve app version and build number
    final packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version; // App version
    final buildNumber = packageInfo.buildNumber; // Build number
    final userEmail = Supabase.instance.client.auth.currentUser?.email ??
        "Unknown User"; // User email
    final devicePlatform = getDevicePlatform(); // Device platform

    // Combine app version and build number
    final appVersionWithBuild = "$appVersion+$buildNumber";

    // Insert error details into Supabase
    final response = await Supabase.instance.client.from('errors').insert({
      'error_message': errorMessage, // Column for the error message
      'stack_trace': errorStackTrace, // Column for the stack trace
      'timestamp':
          DateTime.now().toUtc().toIso8601String(), // Specific timestamp in UTC
      'user_email': userEmail, // User email
      'device_platform': devicePlatform, // Platform (iOS, Android, Web)
      'app_version': appVersionWithBuild, // App version with build number
    }).select(); // Use select() to fetch inserted data for confirmation
  } catch (e) {}
}

String getDevicePlatform() {
  if (Platform.isIOS) return "iOS";
  if (Platform.isAndroid) return "Android";
  if (Platform.isMacOS) return "macOS";
  if (Platform.isWindows) return "Windows";
  if (Platform.isLinux) return "Linux";
  if (Platform.isFuchsia) return "Fuchsia";
  return "Unknown";
}
