import '/backend/supabase/supabase.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  Stream<List<NotificationsRow>>? listViewSupabaseStream;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
  }
}
