import '/flutter_flow/flutter_flow_util.dart';
import 'profile_image_uploader_widget.dart' show ProfileImageUploaderWidget;
import 'package:flutter/material.dart';

class ProfileImageUploaderModel
    extends FlutterFlowModel<ProfileImageUploaderWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_profileImageUpload = false;
  FFUploadedFile uploadedLocalFile_profileImageUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_profileImageUpload = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
