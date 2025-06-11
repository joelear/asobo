import '/backend/schema/structs/index.dart';
import '/components/calendar_day_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'calendar_week_model.dart';
export 'calendar_week_model.dart';

class CalendarWeekWidget extends StatefulWidget {
  const CalendarWeekWidget({
    super.key,
    required this.week,
    required this.callbackAction,
  });

  final CalendarWeekStruct? week;
  final Future Function(DateTime day)? callbackAction;

  @override
  State<CalendarWeekWidget> createState() => _CalendarWeekWidgetState();
}

class _CalendarWeekWidgetState extends State<CalendarWeekWidget> {
  late CalendarWeekModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarWeekModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(0)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(1)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(2)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(3)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(4)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel6,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(5)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.calendarDayModel7,
                  updateCallback: () => safeSetState(() {}),
                  child: CalendarDayWidget(
                    day: widget.week!.days.elementAtOrNull(6)!,
                    action: (day) async {
                      await widget.callbackAction?.call(
                        day,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
          ),
        ],
      ),
    );
  }
}
