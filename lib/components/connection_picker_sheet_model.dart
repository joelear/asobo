import '/components/connection_list_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'connection_picker_sheet_widget.dart' show ConnectionPickerSheetWidget;
import 'package:flutter/material.dart';

class ConnectionPickerSheetModel
    extends FlutterFlowModel<ConnectionPickerSheetWidget> {
  ///  State fields for stateful widgets in this component.

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
