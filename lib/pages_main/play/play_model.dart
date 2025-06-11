import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/calendar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'play_widget.dart' show PlayWidget;
import 'package:flutter/material.dart';

class PlayModel extends FlutterFlowModel<PlayWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - returnFullCalendarStruct] action in play widget.
  CalendarStruct? calendarStruct;
  // Model for calendar component.
  late CalendarModel calendarModel;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? creatorUser;

  @override
  void initState(BuildContext context) {
    calendarModel = createModel(context, () => CalendarModel());
  }

  @override
  void dispose() {
    calendarModel.dispose();
  }
}
