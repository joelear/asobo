import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'golf_profile_setup_widget.dart' show GolfProfileSetupWidget;
import 'package:flutter/material.dart';

class GolfProfileSetupModel extends FlutterFlowModel<GolfProfileSetupWidget> {
  ///  Local state fields for this page.

  bool handicapPositive = false;

  bool toggleTapped = false;

  List<ClubsRow> selectedClubs = [];
  void addToSelectedClubs(ClubsRow item) => selectedClubs.add(item);
  void removeFromSelectedClubs(ClubsRow item) => selectedClubs.remove(item);
  void removeAtIndexFromSelectedClubs(int index) =>
      selectedClubs.removeAt(index);
  void insertAtIndexInSelectedClubs(int index, ClubsRow item) =>
      selectedClubs.insert(index, item);
  void updateSelectedClubsAtIndex(int index, Function(ClubsRow) updateFn) =>
      selectedClubs[index] = updateFn(selectedClubs[index]);

  List<String> selectedClubIds = [];
  void addToSelectedClubIds(String item) => selectedClubIds.add(item);
  void removeFromSelectedClubIds(String item) => selectedClubIds.remove(item);
  void removeAtIndexFromSelectedClubIds(int index) =>
      selectedClubIds.removeAt(index);
  void insertAtIndexInSelectedClubIds(int index, String item) =>
      selectedClubIds.insert(index, item);
  void updateSelectedClubIdsAtIndex(int index, Function(String) updateFn) =>
      selectedClubIds[index] = updateFn(selectedClubIds[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // State field(s) for handicap widget.
  FocusNode? handicapFocusNode;
  TextEditingController? handicapTextController;
  String? Function(BuildContext, String?)? handicapTextControllerValidator;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;
  // Stores action output result for [Backend Call - API (Create Club Membership)] action in bottomOptions widget.
  ApiCallResponse? createMembershipsResponse;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    handicapFocusNode?.dispose();
    handicapTextController?.dispose();

    bottomOptionsModel.dispose();
  }
}
