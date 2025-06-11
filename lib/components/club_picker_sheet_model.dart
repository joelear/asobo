import '/components/page_header/page_header_widget.dart';
import '/components/search_clubs_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'club_picker_sheet_widget.dart' show ClubPickerSheetWidget;
import 'package:flutter/material.dart';

class ClubPickerSheetModel extends FlutterFlowModel<ClubPickerSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for searchClubs component.
  late SearchClubsModel searchClubsModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    searchClubsModel = createModel(context, () => SearchClubsModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    searchClubsModel.dispose();
  }
}
