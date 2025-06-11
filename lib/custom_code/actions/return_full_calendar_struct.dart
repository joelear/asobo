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

Future<CalendarStruct> returnFullCalendarStruct() async {
  // Define the full calendar structure using predefined structs

  List<CalendarMonthStruct> months = [];
  DateTime startDate = DateTime(2023, 1, 1);
  DateTime endDate = DateTime(2025, 12, 31);

  for (int year = startDate.year; year <= endDate.year; year++) {
    for (int month = 1; month <= 12; month++) {
      DateTime firstDayOfMonth = DateTime(year, month, 1);
      DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

      // Calculate the range for full weeks covering the month
      DateTime startOfWeek =
          firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday - 1));
      DateTime endOfWeek =
          lastDayOfMonth.add(Duration(days: 7 - lastDayOfMonth.weekday));

      List<CalendarWeekStruct> weeks = [];
      DateTime currentDay = startOfWeek;

      // Generate weeks
      while (currentDay.isBefore(endOfWeek) ||
          currentDay.isAtSameMomentAs(endOfWeek)) {
        List<CalendarDayStruct> days = [];

        // Generate 7 days (Monday to Sunday)
        for (int i = 0; i < 7; i++) {
          bool isVisible = currentDay.month == month;
          days.add(CalendarDayStruct(
            date: currentDay,
            isVisible: isVisible,
          ));
          currentDay = currentDay.add(Duration(days: 1));
        }

        weeks.add(CalendarWeekStruct(days: days));
      }

      // Add the month to the list of months
      months.add(CalendarMonthStruct(
        year: year,
        month: month,
        weeks: weeks,
        firstTimeStamp: firstDayOfMonth,
      ));
    }
  }

  // Create and return the full calendar struct
  CalendarStruct calendar = CalendarStruct(months: months);
  return calendar;
}
