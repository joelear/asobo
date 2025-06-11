import '/backend/supabase/supabase.dart';
import '/components/course_list_item_small_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'course_list_from_club_model.dart';
export 'course_list_from_club_model.dart';

class CourseListFromClubWidget extends StatefulWidget {
  const CourseListFromClubWidget({
    super.key,
    required this.club,
    this.selectCourseAction,
  });

  final ClubsRow? club;
  final Future Function(CoursesRow course)? selectCourseAction;

  @override
  State<CourseListFromClubWidget> createState() =>
      _CourseListFromClubWidgetState();
}

class _CourseListFromClubWidgetState extends State<CourseListFromClubWidget> {
  late CourseListFromClubModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseListFromClubModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        FutureBuilder<List<CoursesRow>>(
          future: CoursesTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'club_id',
              widget.club?.clubId,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: SpinKitSquareCircle(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ),
                ),
              );
            }
            List<CoursesRow> listViewCoursesRowList = snapshot.data!;

            return ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewCoursesRowList.length,
              itemBuilder: (context, listViewIndex) {
                final listViewCoursesRow =
                    listViewCoursesRowList[listViewIndex];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.selectCourseAction?.call(
                      listViewCoursesRow,
                    );
                  },
                  child: CourseListItemSmallWidget(
                    key: Key(
                        'Keyaom_${listViewIndex}_of_${listViewCoursesRowList.length}'),
                    clubName: widget.club?.clubName,
                    course: listViewCoursesRow,
                    action: () async {
                      await widget.selectCourseAction?.call(
                        listViewCoursesRow,
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
