import '/components/calendar_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'date_picker_sheet_widget.dart' show DatePickerSheetWidget;
import 'package:flutter/material.dart';

class DatePickerSheetModel extends FlutterFlowModel<DatePickerSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for calendar component.
  late CalendarModel calendarModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    calendarModel = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    calendarModel.dispose();
  }
}
