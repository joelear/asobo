import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'new_chat_widget.dart' show NewChatWidget;
import 'package:flutter/material.dart';

class NewChatModel extends FlutterFlowModel<NewChatWidget> {
  ///  Local state fields for this page.

  List<UserConnectionStruct> selectedContacts = [];
  void addToSelectedContacts(UserConnectionStruct item) =>
      selectedContacts.add(item);
  void removeFromSelectedContacts(UserConnectionStruct item) =>
      selectedContacts.remove(item);
  void removeAtIndexFromSelectedContacts(int index) =>
      selectedContacts.removeAt(index);
  void insertAtIndexInSelectedContacts(int index, UserConnectionStruct item) =>
      selectedContacts.insert(index, item);
  void updateSelectedContactsAtIndex(
          int index, Function(UserConnectionStruct) updateFn) =>
      selectedContacts[index] = updateFn(selectedContacts[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<ApiCallResponse>? apiRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
