import '/backend/sqlite/sqlite_manager.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_header/chat_header_widget.dart';
import '/components/chat_trigger_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  String? chatImage;

  String? chatName;

  String? chatBlurHash;

  int? newMessageIndex = 0;

  bool newMessage = false;

  bool isGroup = false;

  String? draftMessage;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - SQLite (getChat)] action in chat widget.
  List<GetChatRow>? chatDetails;
  InstantTimer? instantTimer;
  // Model for chatHeader component.
  late ChatHeaderModel chatHeaderModel;
  // Model for chatTrigger component.
  late ChatTriggerModel chatTriggerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in TextField widget.
  MessagesRow? supabaseInsertMessage;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  MessagesRow? supabaseInsertMessageButton;

  @override
  void initState(BuildContext context) {
    chatHeaderModel = createModel(context, () => ChatHeaderModel());
    chatTriggerModel = createModel(context, () => ChatTriggerModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    chatHeaderModel.dispose();
    chatTriggerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
