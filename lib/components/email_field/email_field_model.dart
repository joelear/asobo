import '/flutter_flow/flutter_flow_util.dart';
import 'email_field_widget.dart' show EmailFieldWidget;
import 'package:flutter/material.dart';

class EmailFieldModel extends FlutterFlowModel<EmailFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
