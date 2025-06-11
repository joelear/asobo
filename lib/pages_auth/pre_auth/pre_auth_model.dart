import '/components/bottom_options/bottom_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pre_auth_widget.dart' show PreAuthWidget;
import 'package:flutter/material.dart';

class PreAuthModel extends FlutterFlowModel<PreAuthWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;

  @override
  void initState(BuildContext context) {
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    bottomOptionsModel.dispose();
  }
}
