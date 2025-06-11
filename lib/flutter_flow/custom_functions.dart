import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime dateTimetoDayDateTime(DateTime inputTime) {
  return DateTime(inputTime.year, inputTime.month, inputTime.day);
}

String relativeDateFromUni(int dateTimeUnix) {
  final DateTime inputDate = DateTime.fromMillisecondsSinceEpoch(dateTimeUnix);
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);
  final DateTime yesterday = today.subtract(Duration(days: 1));
  final DateTime oneWeekAgo = today.subtract(Duration(days: 6));

  if (inputDate.isAfter(today)) {
    return 'Today';
  } else if (inputDate.isAfter(yesterday) && inputDate.isBefore(today)) {
    return 'Yesterday';
  } else if (inputDate.isAfter(oneWeekAgo)) {
    return DateFormat('EEEE').format(inputDate); // Returns day of the week
  } else {
    return DateFormat('EEEE, d\'th\' MMMM').format(inputDate);
  }
}

bool sameDay(
  int? dateTimeUnix1,
  int? dateTimeUnix2,
) {
  if (dateTimeUnix1 == null || dateTimeUnix2 == null) {
    return false;
  }

  final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(dateTimeUnix1);
  final DateTime date2 = DateTime.fromMillisecondsSinceEpoch(dateTimeUnix2);

  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

String relativeTimeOrDateFromDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final localNow = now.toLocal();
  final localDateTime = dateTime.toLocal();

  final difference = localNow.difference(localDateTime);

  final isSameDay = localNow.year == localDateTime.year &&
      localNow.month == localDateTime.month &&
      localNow.day == localDateTime.day;

  final isYesterday = localNow.year == localDateTime.year &&
      localNow.month == localDateTime.month &&
      localNow.day - localDateTime.day == 1;

  final isWithinLastWeek =
      difference.inDays < 7 && localNow.weekday != localDateTime.weekday;

  // Detect if the locale uses US format (MM/DD/YYYY and 12-hour time)
  final usesUSFormat = Intl.defaultLocale?.contains('en_US') ?? false;

  if (isSameDay) {
    return DateFormat(usesUSFormat ? 'hh:mm a' : 'HH:mm').format(localDateTime);
  } else if (isYesterday) {
    return 'Yesterday';
  } else if (isWithinLastWeek) {
    return DateFormat('EEEE').format(localDateTime); // e.g., 'Friday'
  } else {
    return DateFormat(usesUSFormat ? 'MM/dd/yyyy' : 'dd/MM/yyyy')
        .format(localDateTime);
  }
}

String? currencySymbol(String? currencyCode) {
  if (currencyCode == null) return null;

  // Mapping of currency codes to symbols
  const currencySymbols = {
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
    'JPY': '¥',
    'CNY': '¥',
    'INR': '₹',
    'AUD': 'A\$',
    'CAD': 'C\$',
    'CHF': 'CHF',
    'SEK': 'kr',
    'NZD': 'NZ\$',
    'MXN': '\$',
    'SGD': 'S\$',
    'HKD': 'HK\$',
    'NOK': 'kr',
    'KRW': '₩',
    'TRY': '₺',
    'RUB': '₽',
    'BRL': 'R\$',
    'ZAR': 'R',
    'AED': 'د.إ',
  };

  // Return the currency symbol if available, otherwise return the code
  return currencySymbols[currencyCode] ?? currencyCode;
}

bool validTime(String? time) {
  if (time == null || !RegExp(r'^\d{2}:\d{2}$').hasMatch(time)) {
    return false;
  }

  final parts = time.split(':');
  final hour = int.tryParse(parts[0]);
  final minute = int.tryParse(parts[1]);

  if (hour == null || minute == null) return false;

  return hour >= 0 && hour < 24 && minute >= 0 && minute < 60;
}

String? convertCamelCaseToTitle(String? format) {
  if (format == null || format.isEmpty) return '';
  final title = format.replaceAllMapped(
    RegExp(r'([a-z])([A-Z])'),
    (match) => '${match.group(1)} ${match.group(2)}',
  );
  return title[0].toUpperCase() + title.substring(1);
}

String? teeTimePickerHelper(
  String? h12H,
  String? h12M,
  String? h24H,
  String? h24M,
  TimeFormat? timeFormat,
) {
  if (timeFormat == null) return null;

  String pad(String? value) {
    if (value == null) return '00';
    return value.padLeft(2, '0');
  }

  if (timeFormat == TimeFormat.twentyFourHour) {
    final hour = pad(h24H);
    final minute = pad(h24M);
    return '$hour:$minute';
  } else if (timeFormat == TimeFormat.twelveHour) {
    int hour = int.tryParse(h12H ?? '') ?? 0;
    int minute = int.tryParse(h12M ?? '') ?? 0;

    // Defaulting to AM conversion; you can add AM/PM logic if needed
    // Convert to 24-hour format if needed, here assuming no AM/PM
    // e.g., 1 PM -> 13, etc. But for now we'll just pad as-is

    final formattedHour = hour.toString().padLeft(2, '0');
    final formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute';
  }

  return null;
}
