import '/backend/supabase/supabase.dart';
import '/components/data_point_small_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'club_model.dart';
export 'club_model.dart';

class ClubWidget extends StatefulWidget {
  const ClubWidget({
    super.key,
    required this.id,
  });

  final String? id;

  static String routeName = 'club';
  static String routePath = '/club';

  @override
  State<ClubWidget> createState() => _ClubWidgetState();
}

class _ClubWidgetState extends State<ClubWidget> {
  late ClubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClubsRow>>(
      future: ClubsTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: SpinKitSquareCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ),
            ),
          );
        }
        List<ClubsRow> clubClubsRowList = snapshot.data!;

        final clubClubsRow =
            clubClubsRowList.isNotEmpty ? clubClubsRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<CoursesRow>>(
                future: CoursesTable().queryRows(
                  queryFn: (q) => q.eqOrNull(
                    'club_id',
                    clubClubsRow?.clubId,
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
                  List<CoursesRow> containerCoursesRowList = snapshot.data!;

                  return Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.pageHeaderModel,
                          updateCallback: () => safeSetState(() {}),
                          child: PageHeaderWidget(
                            backVisible: true,
                            titleVisible: false,
                            actionVisible: false,
                            titleText: clubClubsRow?.clubName,
                            backAction: () async {
                              context.safePop();
                            },
                            action: () async {},
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    clubClubsRow?.clubName,
                                    'Golf club name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Mona Sans',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Icon(
                                        FFIcons.kproperty1Location,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 18.0,
                                      ),
                                    ),
                                    Text(
                                      '${clubClubsRow?.state}, ${clubClubsRow?.country}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mona Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            clubClubsRow?.clubMembership,
                                            'Type',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          width: 3.0,
                                          height: 3.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        Text(
                                          '${containerCoursesRowList.length.toString()}${containerCoursesRowList.length == 1 ? ' course' : ' courses'}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mona Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            clubClubsRow?.motorCart == true
                                                ? 'Buggies allowed'
                                                : 'No buggies',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mona Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .foreground3,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background3,
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).line1,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final courses =
                                            containerCoursesRowList.toList();

                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              courses.length, (coursesIndex) {
                                            final coursesItem =
                                                courses[coursesIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 8.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.selectedTab =
                                                      coursesIndex;
                                                  safeSetState(() {});
                                                },
                                                child: custom_widgets.CustomTab(
                                                  width: 100.0,
                                                  height: 56.0,
                                                  text: coursesItem.courseName!,
                                                  selected: coursesIndex ==
                                                      _model.selectedTab,
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kterrain,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Expanded(
                                      child: Wrap(
                                        spacing: 16.0,
                                        runSpacing: 4.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          if (containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.courseType !=
                                                  null &&
                                              containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.courseType !=
                                                  '')
                                            wrapWithModel(
                                              model:
                                                  _model.dataPointSmallModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DataPointSmallWidget(
                                                title: 'Course Type',
                                                text: containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)!
                                                    .courseType!,
                                              ),
                                            ),
                                          if (containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.openDate !=
                                                  null &&
                                              containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.openDate !=
                                                  '')
                                            wrapWithModel(
                                              model:
                                                  _model.dataPointSmallModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DataPointSmallWidget(
                                                title: 'Founded',
                                                text: containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)!
                                                    .openDate!,
                                              ),
                                            ),
                                          if (containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.courseArchitect !=
                                                  null &&
                                              containerCoursesRowList
                                                      .elementAtOrNull(
                                                          _model.selectedTab)
                                                      ?.courseArchitect !=
                                                  '')
                                            wrapWithModel(
                                              model:
                                                  _model.dataPointSmallModel3,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: DataPointSmallWidget(
                                                title: 'Architect',
                                                text: containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)!
                                                    .courseArchitect!,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).line1,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kgolfTee,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Wrap(
                                      spacing: 16.0,
                                      runSpacing: 4.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (containerCoursesRowList
                                                .elementAtOrNull(
                                                    _model.selectedTab)
                                                ?.holes !=
                                            null)
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel4,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Holes',
                                              text: containerCoursesRowList
                                                  .elementAtOrNull(
                                                      _model.selectedTab)!
                                                  .holes!
                                                  .toString(),
                                            ),
                                          ),
                                        if (containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)
                                                    ?.openDate !=
                                                null &&
                                            containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)
                                                    ?.openDate !=
                                                '')
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel5,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Short Yd',
                                              text: '-',
                                            ),
                                          ),
                                        if (containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)
                                                    ?.courseArchitect !=
                                                null &&
                                            containerCoursesRowList
                                                    .elementAtOrNull(
                                                        _model.selectedTab)
                                                    ?.courseArchitect !=
                                                '')
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel6,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Long Yd',
                                              text: '-',
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).line1,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kmoney,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    Wrap(
                                      spacing: 16.0,
                                      runSpacing: 4.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        if (containerCoursesRowList
                                                .elementAtOrNull(
                                                    _model.selectedTab)
                                                ?.weekdayPrice !=
                                            null)
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel7,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Weekday',
                                              text:
                                                  '${functions.currencySymbol(containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.currency)}${containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.weekdayPrice?.toString()}',
                                            ),
                                          ),
                                        if (containerCoursesRowList
                                                .elementAtOrNull(
                                                    _model.selectedTab)
                                                ?.weekendPrice !=
                                            null)
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel8,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Weekend',
                                              text:
                                                  '${functions.currencySymbol(containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.currency)}${containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.weekendPrice?.toString()}',
                                            ),
                                          ),
                                        if (containerCoursesRowList
                                                .elementAtOrNull(
                                                    _model.selectedTab)
                                                ?.twilightPrice !=
                                            null)
                                          wrapWithModel(
                                            model: _model.dataPointSmallModel9,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: DataPointSmallWidget(
                                              title: 'Twilight',
                                              text:
                                                  '${functions.currencySymbol(containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.currency)}${containerCoursesRowList.elementAtOrNull(_model.selectedTab)?.twilightPrice?.toString()}',
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 16.0)),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
