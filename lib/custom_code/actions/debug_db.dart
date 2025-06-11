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

import 'package:sqflite/sqflite.dart';

Future debugDb() async {
  try {
    // Step 1: Get the database path
    final databasesPath = await getDatabasesPath();
    final dbPath =
        '$databasesPath/app_data.sqlite'; // Replace 'app_data.sqlite' with your database name
    print('Database Path: $dbPath');

    // Step 2: Open the database
    final Database db = await openDatabase(dbPath);
    print('Database opened successfully.');

    // Step 3: List all tables in the database
    print('Fetching all tables...');
    final List<Map<String, dynamic>> tables =
        await db.rawQuery("SELECT name FROM sqlite_master WHERE type='table';");
    if (tables.isEmpty) {
      print('No tables found in the database.');
    } else {
      print('Tables in the database:');
      for (final table in tables) {
        print(table['name']);
      }
    }

    // Step 4: Check if the table 'testSql' exists
    final List<Map<String, dynamic>> tableCheck = await db.rawQuery(
        "SELECT name FROM sqlite_master WHERE type='table' AND name='testSql';");
    if (tableCheck.isEmpty) {
      print(
          "Table 'testSql' does not exist. Check your database configuration.");
      await db.close();
      return;
    }
    print("Table 'testSql' exists.");

    // Step 5: Print the table schema
    print('Fetching table schema...');
    final List<Map<String, dynamic>> schema =
        await db.rawQuery("PRAGMA table_info(testSql);");
    print('Schema for table "testSql":');
    for (final row in schema) {
      print(row);
    }

    // Step 6: Query all rows in the table
    print('Fetching all rows from table...');
    final List<Map<String, dynamic>> results = await db.query('testSql');
    if (results.isEmpty) {
      print('No rows found in table "testSql".');
    } else {
      print('Rows in table "testSql":');
      for (final row in results) {
        print(row);
      }
    }

    // Step 7: Close the database
    await db.close();
    print('Database closed successfully.');
  } catch (e, stacktrace) {
    print('Error occurred: $e');
    print('Stacktrace: $stacktrace');
  }
}
