import '/backend/supabase/supabase.dart';
import '/components/course_list_from_club_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'course_picker_sheet_model.dart';
export 'course_picker_sheet_model.dart';

class CoursePickerSheetWidget extends StatefulWidget {
  const CoursePickerSheetWidget({
    super.key,
    this.selectCourseAction,
    this.club,
  });

  final Future Function(CoursesRow course)? selectCourseAction;
  final ClubsRow? club;

  @override
  State<CoursePickerSheetWidget> createState() =>
      _CoursePickerSheetWidgetState();
}

class _CoursePickerSheetWidgetState extends State<CoursePickerSheetWidget> {
  late CoursePickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePickerSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 64.0,
              height: 4.0,
              constraints: BoxConstraints(
                maxWidth: 64.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            wrapWithModel(
              model: _model.pageHeaderModel,
              updateCallback: () => safeSetState(() {}),
              child: PageHeaderWidget(
                backVisible: false,
                titleVisible: true,
                actionVisible: true,
                titleText: 'Select course',
                actionText: 'Cancel',
                hideLine: true,
                backAction: () async {},
                action: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            wrapWithModel(
              model: _model.courseListFromClubModel,
              updateCallback: () => safeSetState(() {}),
              child: CourseListFromClubWidget(
                club: widget.club!,
                selectCourseAction: (course) async {
                  await widget.selectCourseAction?.call(
                    course,
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 48.0,
              decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
