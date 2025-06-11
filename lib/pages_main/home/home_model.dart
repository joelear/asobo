import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_trigger_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getUpcomingRounds)] action in home widget.
  ApiCallResponse? upcomingRounds;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? creatorUser;
  // Model for chatTrigger component.
  late ChatTriggerModel chatTriggerModel;

  @override
  void initState(BuildContext context) {
    chatTriggerModel = createModel(context, () => ChatTriggerModel());
  }

  @override
  void dispose() {
    chatTriggerModel.dispose();
  }
}
