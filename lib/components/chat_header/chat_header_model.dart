import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_header_widget.dart' show ChatHeaderWidget;
import 'package:flutter/material.dart';

class ChatHeaderModel extends FlutterFlowModel<ChatHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for profileImage component.
  late ProfileImageModel profileImageModel;

  @override
  void initState(BuildContext context) {
    profileImageModel = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    profileImageModel.dispose();
  }
}
