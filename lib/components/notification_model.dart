import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'notification_widget.dart' show NotificationWidget;
import 'package:flutter/material.dart';

class NotificationModel extends FlutterFlowModel<NotificationWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileImage component.
  late ProfileImageModel profileImageModel;
  Completer<List<ConnectionsRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {
    profileImageModel = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    profileImageModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
