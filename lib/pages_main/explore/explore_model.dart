import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/chat_trigger_widget.dart';
import '/components/header_search_bar_widget.dart';
import '/components/list_button_widget.dart';
import '/components/tab_pill_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'dart:async';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  Local state fields for this page.

  ExplorePageTabs? selectedTab = ExplorePageTabs.Network;

  int? pendingRequests;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in explore widget.
  List<ConnectionsRow>? pendingConnections;
  // Model for headerSearchBar component.
  late HeaderSearchBarModel headerSearchBarModel;
  Completer<List<ClubsRow>>? requestCompleter1;
  Completer<List<UsersRow>>? requestCompleter2;
  // Model for tabPill component.
  late TabPillModel tabPillModel1;
  // Model for tabPill component.
  late TabPillModel tabPillModel2;
  // Model for listButton component.
  late ListButtonModel listButtonModel;
  // Model for chatTrigger component.
  late ChatTriggerModel chatTriggerModel;

  /// Query cache managers for this widget.

  final _getClubsManager = FutureRequestManager<List<ClubsRow>>();
  Future<List<ClubsRow>> getClubs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ClubsRow>> Function() requestFn,
  }) =>
      _getClubsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetClubsCache() => _getClubsManager.clear();
  void clearGetClubsCacheKey(String? uniqueKey) =>
      _getClubsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    headerSearchBarModel = createModel(context, () => HeaderSearchBarModel());
    tabPillModel1 = createModel(context, () => TabPillModel());
    tabPillModel2 = createModel(context, () => TabPillModel());
    listButtonModel = createModel(context, () => ListButtonModel());
    chatTriggerModel = createModel(context, () => ChatTriggerModel());
  }

  @override
  void dispose() {
    headerSearchBarModel.dispose();
    tabPillModel1.dispose();
    tabPillModel2.dispose();
    listButtonModel.dispose();
    chatTriggerModel.dispose();

    /// Dispose query cache managers for this widget.

    clearGetClubsCache();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
