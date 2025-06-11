// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class CustomTab extends StatefulWidget {
  const CustomTab({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.selected = false,
  });

  final double? width;
  final double? height;
  final String text;
  final bool selected;

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          // Text Widget with 16px padding above
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Mona Sans',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                    color: widget.selected
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).foreground3, // New rule
                  ),
            ),
          ),

          // 16px spacing between text and underline
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: 1.0, // Ensure the line always takes up space
              width: double.infinity, // Matches text width
              decoration: BoxDecoration(
                color: widget.selected
                    ? FlutterFlowTheme.of(context)
                        .primary // Visible when selected
                    : Colors.transparent, // Invisible but still takes up space
              ),
            ),
          ),
        ],
      ),
    );
  }
}
