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

import 'dart:ui';

class DashedBorder extends StatefulWidget {
  const DashedBorder({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DashedBorder> createState() => _DashedBorderState();
}

class _DashedBorderState extends State<DashedBorder> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(widget.width ?? 100.0, widget.height ?? 100.0),
      painter: DashedBorderPainter(FlutterFlowTheme.of(context).alternate),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  DashedBorderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(8.0)));

    final Path dashedPath = _createDashedPath(path);
    canvas.drawPath(dashedPath, paint);
  }

  Path _createDashedPath(Path path) {
    const double dashLength = 6.0;
    const double gapLength = 4.0;
    final Path dashedPath = Path();
    final metrics = path.computeMetrics(forceClosed: false);

    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double nextDashEnd = distance + dashLength;
        dashedPath.addPath(
          metric.extractPath(distance, nextDashEnd.clamp(0, metric.length)),
          Offset.zero,
        );
        distance = nextDashEnd + gapLength;
      }
    }
    return dashedPath;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
