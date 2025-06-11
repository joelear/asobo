import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'referral_code_widget.dart' show ReferralCodeWidget;
import 'package:flutter/material.dart';

class ReferralCodeModel extends FlutterFlowModel<ReferralCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    bottomOptionsModel.dispose();
  }
}
