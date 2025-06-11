import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_options/bottom_options_widget.dart';
import '/components/drop_down_button_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/player_selected_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_round_widget.dart' show CreateRoundWidget;
import 'package:flutter/material.dart';

class CreateRoundModel extends FlutterFlowModel<CreateRoundWidget> {
  ///  Local state fields for this component.

  RoundStruct? roundDetails;
  void updateRoundDetailsStruct(Function(RoundStruct) updateFn) {
    updateFn(roundDetails ??= RoundStruct());
  }

  UsersRow? players;

  ClubsRow? roundClub;

  CoursesRow? roundCourse;

  List<UserConnectionStruct> selectedConnections = [];
  void addToSelectedConnections(UserConnectionStruct item) =>
      selectedConnections.add(item);
  void removeFromSelectedConnections(UserConnectionStruct item) =>
      selectedConnections.remove(item);
  void removeAtIndexFromSelectedConnections(int index) =>
      selectedConnections.removeAt(index);
  void insertAtIndexInSelectedConnections(
          int index, UserConnectionStruct item) =>
      selectedConnections.insert(index, item);
  void updateSelectedConnectionsAtIndex(
          int index, Function(UserConnectionStruct) updateFn) =>
      selectedConnections[index] = updateFn(selectedConnections[index]);

  List<String> selectedPlayerIds = [];
  void addToSelectedPlayerIds(String item) => selectedPlayerIds.add(item);
  void removeFromSelectedPlayerIds(String item) =>
      selectedPlayerIds.remove(item);
  void removeAtIndexFromSelectedPlayerIds(int index) =>
      selectedPlayerIds.removeAt(index);
  void insertAtIndexInSelectedPlayerIds(int index, String item) =>
      selectedPlayerIds.insert(index, item);
  void updateSelectedPlayerIdsAtIndex(int index, Function(String) updateFn) =>
      selectedPlayerIds[index] = updateFn(selectedPlayerIds[index]);

  CreateRoundRequestStruct? createRoundBody;
  void updateCreateRoundBodyStruct(
      Function(CreateRoundRequestStruct) updateFn) {
    updateFn(createRoundBody ??= CreateRoundRequestStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel1;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel2;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel3;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel4;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel5;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel6;
  // Model for DropDownButton component.
  late DropDownButtonModel dropDownButtonModel7;
  // Model for playerSelected component.
  late PlayerSelectedModel playerSelectedModel1;
  // Model for bottomOptions component.
  late BottomOptionsModel bottomOptionsModel;
  // Stores action output result for [Backend Call - API (Create golf round )] action in bottomOptions widget.
  ApiCallResponse? responseJson;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    dropDownButtonModel1 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel2 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel3 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel4 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel5 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel6 = createModel(context, () => DropDownButtonModel());
    dropDownButtonModel7 = createModel(context, () => DropDownButtonModel());
    playerSelectedModel1 = createModel(context, () => PlayerSelectedModel());
    bottomOptionsModel = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    dropDownButtonModel1.dispose();
    dropDownButtonModel2.dispose();
    dropDownButtonModel3.dispose();
    dropDownButtonModel4.dispose();
    dropDownButtonModel5.dispose();
    dropDownButtonModel6.dispose();
    dropDownButtonModel7.dispose();
    playerSelectedModel1.dispose();
    bottomOptionsModel.dispose();
  }
}
