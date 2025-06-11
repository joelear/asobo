import '/components/connection_list_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'contact_widget.dart' show ContactWidget;
import 'package:flutter/material.dart';

class ContactModel extends FlutterFlowModel<ContactWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for connectionList component.
  late ConnectionListModel connectionListModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    connectionListModel = createModel(context, () => ConnectionListModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    connectionListModel.dispose();
  }
}
