import '/components/page_header/page_header_widget.dart';
import '/components/simple_list_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'format_picker_sheet_widget.dart' show FormatPickerSheetWidget;
import 'package:flutter/material.dart';

class FormatPickerSheetModel extends FlutterFlowModel<FormatPickerSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Models for simpleListItem dynamic component.
  late FlutterFlowDynamicModels<SimpleListItemModel> simpleListItemModels;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    simpleListItemModels =
        FlutterFlowDynamicModels(() => SimpleListItemModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    simpleListItemModels.dispose();
  }
}
