import '/backend/supabase/supabase.dart';
import '/components/bottom_options/bottom_options_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_contacts_setup_widget.dart' show AddContactsSetupWidget;
import 'package:flutter/material.dart';

class AddContactsSetupModel extends FlutterFlowModel<AddContactsSetupWidget> {
  ///  Local state fields for this page.

  List<String> selectedContactIds = [];
  void addToSelectedContactIds(String item) => selectedContactIds.add(item);
  void removeFromSelectedContactIds(String item) =>
      selectedContactIds.remove(item);
  void removeAtIndexFromSelectedContactIds(int index) =>
      selectedContactIds.removeAt(index);
  void insertAtIndexInSelectedContactIds(int index, String item) =>
      selectedContactIds.insert(index, item);
  void updateSelectedContactIdsAtIndex(int index, Function(String) updateFn) =>
      selectedContactIds[index] = updateFn(selectedContactIds[index]);

  List<UsersRow> selectedContactRows = [];
  void addToSelectedContactRows(UsersRow item) => selectedContactRows.add(item);
  void removeFromSelectedContactRows(UsersRow item) =>
      selectedContactRows.remove(item);
  void removeAtIndexFromSelectedContactRows(int index) =>
      selectedContactRows.removeAt(index);
  void insertAtIndexInSelectedContactRows(int index, UsersRow item) =>
      selectedContactRows.insert(index, item);
  void updateSelectedContactRowsAtIndex(
          int index, Function(UsersRow) updateFn) =>
      selectedContactRows[index] = updateFn(selectedContactRows[index]);

  List<UsersRow> selectedSuggestedContactRows = [];
  void addToSelectedSuggestedContactRows(UsersRow item) =>
      selectedSuggestedContactRows.add(item);
  void removeFromSelectedSuggestedContactRows(UsersRow item) =>
      selectedSuggestedContactRows.remove(item);
  void removeAtIndexFromSelectedSuggestedContactRows(int index) =>
      selectedSuggestedContactRows.removeAt(index);
  void insertAtIndexInSelectedSuggestedContactRows(int index, UsersRow item) =>
      selectedSuggestedContactRows.insert(index, item);
  void updateSelectedSuggestedContactRowsAtIndex(
          int index, Function(UsersRow) updateFn) =>
      selectedSuggestedContactRows[index] =
          updateFn(selectedSuggestedContactRows[index]);

  List<String> selectedSuggestedContactIds = [];
  void addToSelectedSuggestedContactIds(String item) =>
      selectedSuggestedContactIds.add(item);
  void removeFromSelectedSuggestedContactIds(String item) =>
      selectedSuggestedContactIds.remove(item);
  void removeAtIndexFromSelectedSuggestedContactIds(int index) =>
      selectedSuggestedContactIds.removeAt(index);
  void insertAtIndexInSelectedSuggestedContactIds(int index, String item) =>
      selectedSuggestedContactIds.insert(index, item);
  void updateSelectedSuggestedContactIdsAtIndex(
          int index, Function(String) updateFn) =>
      selectedSuggestedContactIds[index] =
          updateFn(selectedSuggestedContactIds[index]);

  int? addedSelectedUsers = 0;

  int? addedSuggestedUsers = 0;

  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    bottomOptionsModel.dispose();
  }
}
