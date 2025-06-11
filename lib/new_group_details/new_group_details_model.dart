import '/backend/api_requests/api_calls.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages_main/profile_image_uploader/profile_image_uploader_widget.dart';
import '/index.dart';
import 'new_group_details_widget.dart' show NewGroupDetailsWidget;
import 'package:flutter/material.dart';

class NewGroupDetailsModel extends FlutterFlowModel<NewGroupDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Stores action output result for [Backend Call - API (Create group chat)] action in pageHeader widget.
  ApiCallResponse? newGroupOutput;
  // State field(s) for groupName widget.
  FocusNode? groupNameFocusNode;
  TextEditingController? groupNameTextController;
  String? Function(BuildContext, String?)? groupNameTextControllerValidator;
  // Model for groupImageUploader.
  late ProfileImageUploaderModel groupImageUploaderModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    groupImageUploaderModel =
        createModel(context, () => ProfileImageUploaderModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    groupNameFocusNode?.dispose();
    groupNameTextController?.dispose();

    groupImageUploaderModel.dispose();
  }
}
