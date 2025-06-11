import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/blank_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'chat_trigger_model.dart';
export 'chat_trigger_model.dart';

class ChatTriggerWidget extends StatefulWidget {
  const ChatTriggerWidget({super.key});

  @override
  State<ChatTriggerWidget> createState() => _ChatTriggerWidgetState();
}

class _ChatTriggerWidgetState extends State<ChatTriggerWidget> {
  late ChatTriggerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatTriggerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatNotificationsRow>>(
      stream: _model.chatNotificationsTriggerSupabaseStream ??= SupaFlow.client
          .from("chat_notifications")
          .stream(primaryKey: ['id'])
          .eqOrNull(
            'recipient_id',
            currentUserUid,
          )
          .map(
              (list) => list.map((item) => ChatNotificationsRow(item)).toList())
        ..listen((_) async {
          FFAppState().newChatsAvailable = true;
          FFAppState().newMessagesAvailable = true;
          FFAppState().update(() {});

          safeSetState(() {});
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 1.0,
            child: BlankComponentWidget(),
          );
        }
        List<ChatNotificationsRow>
            chatNotificationsTriggerChatNotificationsRowList = snapshot.data!;

        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        );
      },
    );
  }
}
