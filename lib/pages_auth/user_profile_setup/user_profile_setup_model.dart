import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages_main/profile_image_uploader/profile_image_uploader_widget.dart';
import '/index.dart';
import 'user_profile_setup_widget.dart' show UserProfileSetupWidget;
import 'package:flutter/material.dart';

class UserProfileSetupModel extends FlutterFlowModel<UserProfileSetupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // Model for profileImageUploader component.
  late ProfileImageUploaderModel profileImageUploaderModel;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for occupation widget.
  FocusNode? occupationFocusNode;
  TextEditingController? occupationTextController;
  String? Function(BuildContext, String?)? occupationTextControllerValidator;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    profileImageUploaderModel =
        createModel(context, () => ProfileImageUploaderModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    profileImageUploaderModel.dispose();
    locationFocusNode?.dispose();
    locationTextController?.dispose();

    occupationFocusNode?.dispose();
    occupationTextController?.dispose();

    bottomOptionsModel.dispose();
  }
}
