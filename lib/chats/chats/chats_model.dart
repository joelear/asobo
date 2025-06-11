import '/backend/supabase/supabase.dart';
import '/components/chat_trigger_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'chats_widget.dart' show ChatsWidget;
import 'package:flutter/material.dart';

class ChatsModel extends FlutterFlowModel<ChatsWidget> {
  ///  Local state fields for this page.

  bool chatsAvailable = true;

  List<ConnectionsRow> userConnections = [];
  void addToUserConnections(ConnectionsRow item) => userConnections.add(item);
  void removeFromUserConnections(ConnectionsRow item) =>
      userConnections.remove(item);
  void removeAtIndexFromUserConnections(int index) =>
      userConnections.removeAt(index);
  void insertAtIndexInUserConnections(int index, ConnectionsRow item) =>
      userConnections.insert(index, item);
  void updateUserConnectionsAtIndex(
          int index, Function(ConnectionsRow) updateFn) =>
      userConnections[index] = updateFn(userConnections[index]);

  bool newMessage = true;

  int newMessageIndex = 0;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for chatTrigger component.
  late ChatTriggerModel chatTriggerModel;

  @override
  void initState(BuildContext context) {
    chatTriggerModel = createModel(context, () => ChatTriggerModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    chatTriggerModel.dispose();
  }
}
