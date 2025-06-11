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

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<String?> initialiseOneSignal(String? userId) async {
  print('[OneSignal] Initialising...');
  const String oneSignalAppId = 'd0368b85-aa83-4a3d-add7-576d6f649f6d';

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize(oneSignalAppId);
  print('[OneSignal] Initialised with App ID: $oneSignalAppId');

  await OneSignal.Notifications.requestPermission(true);
  print('[OneSignal] Requested push notification permission');

  // Wait for Player ID and Token
  dynamic subscription;
  for (int i = 0; i < 10; i++) {
    subscription = await OneSignal.User.pushSubscription;
    if (subscription?.id != null && subscription?.token != null) break;
    print('[OneSignal] Waiting for Player ID... (attempt $i)');
    await Future.delayed(Duration(seconds: 1));
  }

  final playerId = subscription?.id;
  final pushToken = subscription?.token;

  print('[OneSignal] Push Token: $pushToken');
  print('[OneSignal] Player ID: $playerId');

  // Optional: Reset app state flag each time
  FFAppState().isOneSignalInit = true;

  return playerId;
}
