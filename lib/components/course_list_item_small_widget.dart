import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'course_list_item_small_model.dart';
export 'course_list_item_small_model.dart';

class CourseListItemSmallWidget extends StatefulWidget {
  const CourseListItemSmallWidget({
    super.key,
    required this.course,
    required this.action,
    this.clubName,
  });

  final CoursesRow? course;
  final Future Function()? action;
  final String? clubName;

  @override
  State<CourseListItemSmallWidget> createState() =>
      _CourseListItemSmallWidgetState();
}

class _CourseListItemSmallWidgetState extends State<CourseListItemSmallWidget> {
  late CourseListItemSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CourseListItemSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.action?.call();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                child: Icon(
                  FFIcons.kproperty1FlagCircle,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 18.0,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.course?.courseName,
                        'Course name',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Mona Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                    if (widget.clubName != null && widget.clubName != '')
                      Text(
                        valueOrDefault<String>(
                          widget.clubName,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                  ].divide(SizedBox(height: 2.0)),
                ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}
