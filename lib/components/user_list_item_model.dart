import '/components/profile_image_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_list_item_widget.dart' show UserListItemWidget;
import 'package:flutter/material.dart';

class UserListItemModel extends FlutterFlowModel<UserListItemWidget> {
  ///  Local state fields for this component.

  bool checked = false;

  bool selected = false;

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
