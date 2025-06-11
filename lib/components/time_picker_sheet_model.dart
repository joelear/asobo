import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/time_picker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'time_picker_sheet_widget.dart' show TimePickerSheetWidget;
import 'package:flutter/material.dart';

class TimePickerSheetModel extends FlutterFlowModel<TimePickerSheetWidget> {
  ///  Local state fields for this component.

  bool invalidTime = false;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for timePicker component.
  late TimePickerModel timePickerModel;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    timePickerModel = createModel(context, () => TimePickerModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    pageHeaderModel.dispose();
    timePickerModel.dispose();
    bottomOptionsModel.dispose();
  }
}
