import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'message_other_widget.dart' show MessageOtherWidget;
import 'package:flutter/material.dart';

class MessageOtherModel extends FlutterFlowModel<MessageOtherWidget> {
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
