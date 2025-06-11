import '/components/calendar_day_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'calendar_week_widget.dart' show CalendarWeekWidget;
import 'package:flutter/material.dart';

class CalendarWeekModel extends FlutterFlowModel<CalendarWeekWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel1;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel2;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel3;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel4;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel5;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel6;
  // Model for CalendarDay component.
  late CalendarDayModel calendarDayModel7;

  @override
  void initState(BuildContext context) {
    calendarDayModel1 = createModel(context, () => CalendarDayModel());
    calendarDayModel2 = createModel(context, () => CalendarDayModel());
    calendarDayModel3 = createModel(context, () => CalendarDayModel());
    calendarDayModel4 = createModel(context, () => CalendarDayModel());
    calendarDayModel5 = createModel(context, () => CalendarDayModel());
    calendarDayModel6 = createModel(context, () => CalendarDayModel());
    calendarDayModel7 = createModel(context, () => CalendarDayModel());
  }

  @override
  void dispose() {
    calendarDayModel1.dispose();
    calendarDayModel2.dispose();
    calendarDayModel3.dispose();
    calendarDayModel4.dispose();
    calendarDayModel5.dispose();
    calendarDayModel6.dispose();
    calendarDayModel7.dispose();
  }
}
