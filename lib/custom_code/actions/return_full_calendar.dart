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

Future<dynamic> returnFullCalendar() async {
  // Define the full calendar structure
  Map<String, dynamic> calendar = {};
  DateTime startDate = DateTime(2023, 1, 1);
  DateTime endDate = DateTime(2025, 12, 31);

  List<Map<String, dynamic>> months = [];

  for (int year = startDate.year; year <= endDate.year; year++) {
    for (int month = 1; month <= 12; month++) {
      DateTime firstDayOfMonth = DateTime(year, month, 1);
      DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

      // Calculate the range for full weeks covering the month
      DateTime startOfWeek =
          firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
      DateTime endOfWeek =
          lastDayOfMonth.add(Duration(days: 7 - lastDayOfMonth.weekday));

      List<Map<String, dynamic>> weeks = [];
      DateTime currentDay = startOfWeek;

      // Generate weeks
      while (currentDay.isBefore(endOfWeek) ||
          currentDay.isAtSameMomentAs(endOfWeek)) {
        List<Map<String, dynamic>> days = [];

        // Generate 7 days (Monday to Sunday)
        for (int i = 0; i < 7; i++) {
          days.add({'date': currentDay.toIso8601String()});
          currentDay = currentDay.add(Duration(days: 1));
        }

        weeks.add({'days': days});
      }

      // Add the month to the calendar
      months.add({
        'year': year,
        'month': month,
        'weeks': weeks,
      });
    }
  }

  calendar['months'] = months;

  // Print the full calendar structure for debugging
  print(calendar);

  return calendar;
}
