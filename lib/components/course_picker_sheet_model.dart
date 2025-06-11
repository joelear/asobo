import '/components/course_list_from_club_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_picker_sheet_widget.dart' show CoursePickerSheetWidget;
import 'package:flutter/material.dart';

class CoursePickerSheetModel extends FlutterFlowModel<CoursePickerSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for courseListFromClub component.
  late CourseListFromClubModel courseListFromClubModel;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    courseListFromClubModel =
        createModel(context, () => CourseListFromClubModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    courseListFromClubModel.dispose();
  }
}
