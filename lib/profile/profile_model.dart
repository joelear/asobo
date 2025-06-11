import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for profileImage component.
  late ProfileImageModel profileImageModel;
  // Stores action output result for [Backend Call - Insert Row] action in connectButton widget.
  ConnectionsRow? createConnectionOutput;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    profileImageModel = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    profileImageModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
