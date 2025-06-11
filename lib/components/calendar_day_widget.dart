import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calendar_day_model.dart';
export 'calendar_day_model.dart';

class CalendarDayWidget extends StatefulWidget {
  const CalendarDayWidget({
    super.key,
    required this.day,
    required this.action,
  });

  final CalendarDayStruct? day;

  /// callbackAction
  final Future Function(DateTime day)? action;

  @override
  State<CalendarDayWidget> createState() => _CalendarDayWidgetState();
}

class _CalendarDayWidgetState extends State<CalendarDayWidget> {
  late CalendarDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarDayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.day!.isVisible) {
          await widget.action?.call(
            widget.day!.date!,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: dateTimeFormat("d/M/y", FFAppState().dateSelected) ==
                  dateTimeFormat("d/M/y", widget.day?.date)
              ? FlutterFlowTheme.of(context).secondary
              : FlutterFlowTheme.of(context).primaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  constraints: BoxConstraints(
                    maxWidth: 32.0,
                    maxHeight: 32.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: (dateTimeFormat("d/M/y", widget.day?.date) ==
                                  dateTimeFormat(
                                      "d/M/y", getCurrentTimestamp)) &&
                              widget.day!.isVisible
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0x00000000),
                      width: 2.0,
                    ),
                  ),
                  child: Visibility(
                    visible: widget.day?.isVisible ?? true,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        dateTimeFormat("d", widget.day!.date!),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Mona Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
