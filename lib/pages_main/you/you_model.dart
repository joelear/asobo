import '/components/page_header/page_header_widget.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'you_widget.dart' show YouWidget;
import 'package:flutter/material.dart';

class YouModel extends FlutterFlowModel<YouWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for profileImage component.
  late ProfileImageModel profileImageModel;
  // Stores action output result for [Custom Action - initialiseOneSignal] action in seeTestData widget.
  String? playerId;

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
}
