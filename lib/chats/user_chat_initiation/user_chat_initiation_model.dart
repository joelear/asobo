import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_chat_initiation_widget.dart' show UserChatInitiationWidget;
import 'package:flutter/material.dart';

class UserChatInitiationModel
    extends FlutterFlowModel<UserChatInitiationWidget> {
  ///  Local state fields for this component.

  UsersRow? userRow;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in userChatInitiation widget.
  List<UsersRow>? userRowOutput;
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
