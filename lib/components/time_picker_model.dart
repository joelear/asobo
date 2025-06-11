import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'time_picker_widget.dart' show TimePickerWidget;
import 'package:flutter/material.dart';

class TimePickerModel extends FlutterFlowModel<TimePickerWidget> {
  ///  Local state fields for this component.
  /// HH:MM
  String selectedTime = '00:00';

  TimeFormat? timeFormat = TimeFormat.twentyFourHour;

  bool invalidTime = false;

  bool? am = true;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // State field(s) for hour24h widget.
  FocusNode? hour24hFocusNode;
  TextEditingController? hour24hTextController;
  String? Function(BuildContext, String?)? hour24hTextControllerValidator;
  // State field(s) for minute24h widget.
  FocusNode? minute24hFocusNode;
  TextEditingController? minute24hTextController;
  String? Function(BuildContext, String?)? minute24hTextControllerValidator;
  // State field(s) for hour12h widget.
  FocusNode? hour12hFocusNode;
  TextEditingController? hour12hTextController;
  String? Function(BuildContext, String?)? hour12hTextControllerValidator;
  // State field(s) for minute12h widget.
  FocusNode? minute12hFocusNode;
  TextEditingController? minute12hTextController;
  String? Function(BuildContext, String?)? minute12hTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    hour24hFocusNode?.dispose();
    hour24hTextController?.dispose();

    minute24hFocusNode?.dispose();
    minute24hTextController?.dispose();

    hour12hFocusNode?.dispose();
    hour12hTextController?.dispose();

    minute12hFocusNode?.dispose();
    minute12hTextController?.dispose();
  }
}
