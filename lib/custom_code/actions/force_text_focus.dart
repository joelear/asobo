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

Future forceTextFocus(BuildContext context) async {
  debugPrint('forceTextFocus: Entered the function.');

  try {
    bool foundFocusNode = _findAndFocusTextField(context);

    if (!foundFocusNode) {
      debugPrint(
          'forceTextFocus: No EditableText or FocusNode found in the widget tree.');
    }
  } catch (e) {
    debugPrint('forceTextFocus: Error encountered - $e');
  }

  debugPrint('forceTextFocus: Exiting the function.');
}

bool _findAndFocusTextField(BuildContext context) {
  bool found = false;

  context.visitChildElements((element) {
    final widget = element.widget;

    // Check for EditableText
    if (widget is EditableText) {
      debugPrint('forceTextFocus: Found EditableText.');
      final focusNode = widget.focusNode;
      if (focusNode != null) {
        debugPrint('forceTextFocus: Found FocusNode. Requesting focus...');
        focusNode.requestFocus();
        found = true;
      }
    }

    // Recurse into children
    if (!found) {
      found = _findAndFocusTextField(element);
    }
  });

  return found;
}
