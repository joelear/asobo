import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/time_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'time_picker_sheet_model.dart';
export 'time_picker_sheet_model.dart';

class TimePickerSheetWidget extends StatefulWidget {
  const TimePickerSheetWidget({
    super.key,
    this.selectTimeAction,
  });

  final Future Function(String timeString)? selectTimeAction;

  @override
  State<TimePickerSheetWidget> createState() => _TimePickerSheetWidgetState();
}

class _TimePickerSheetWidgetState extends State<TimePickerSheetWidget> {
  late TimePickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePickerSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 50),
        callback: (timer) async {
          if (functions.validTime(FFAppState().selectedTime) != true) {
            _model.invalidTime = true;
            safeSetState(() {});
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64.0,
              height: 4.0,
              constraints: BoxConstraints(
                maxWidth: 64.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            wrapWithModel(
              model: _model.pageHeaderModel,
              updateCallback: () => safeSetState(() {}),
              child: PageHeaderWidget(
                backVisible: false,
                titleVisible: true,
                actionVisible: true,
                titleText: 'Select a time',
                actionText: 'Cancel',
                hideLine: true,
                backAction: () async {},
                action: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              height: 24.0,
              decoration: BoxDecoration(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Container(
                decoration: BoxDecoration(),
                child: wrapWithModel(
                  model: _model.timePickerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TimePickerWidget(),
                ),
              ),
            ),
            if (_model.invalidTime)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Text(
                  'Invalid time',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mona Sans',
                        color: FlutterFlowTheme.of(context).error,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            wrapWithModel(
              model: _model.bottomOptionsModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomOptionsWidget(
                primaryVisible: true,
                secondaryVisible: false,
                tertiaryVisible: false,
                primaryText: 'Select time',
                primaryAction: () async {},
                secondaryAction: () async {},
                tertiaryAction: () async {},
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 24.0,
              decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
