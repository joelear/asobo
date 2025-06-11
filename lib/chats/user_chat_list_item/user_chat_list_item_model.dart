import '/backend/supabase/supabase.dart';
import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'user_chat_list_item_widget.dart' show UserChatListItemWidget;
import 'package:flutter/material.dart';

class UserChatListItemModel extends FlutterFlowModel<UserChatListItemWidget> {
  ///  Local state fields for this component.

  ChatsRow? chatRow;

  bool tapped = false;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Model for profileImage component.
  late ProfileImageModel profileImageModel;

  @override
  void initState(BuildContext context) {
    profileImageModel = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    profileImageModel.dispose();
  }
}
