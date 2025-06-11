import '/components/data_point_small_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'club_widget.dart' show ClubWidget;
import 'package:flutter/material.dart';

class ClubModel extends FlutterFlowModel<ClubWidget> {
  ///  Local state fields for this page.

  int selectedTab = 0;

  ///  State fields for stateful widgets in this page.

  // Model for pageHeader component.
  late PageHeaderModel pageHeaderModel;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel1;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel2;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel3;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel4;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel5;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel6;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel7;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel8;
  // Model for dataPointSmall component.
  late DataPointSmallModel dataPointSmallModel9;

  @override
  void initState(BuildContext context) {
    pageHeaderModel = createModel(context, () => PageHeaderModel());
    dataPointSmallModel1 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel2 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel3 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel4 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel5 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel6 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel7 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel8 = createModel(context, () => DataPointSmallModel());
    dataPointSmallModel9 = createModel(context, () => DataPointSmallModel());
  }

  @override
  void dispose() {
    pageHeaderModel.dispose();
    dataPointSmallModel1.dispose();
    dataPointSmallModel2.dispose();
    dataPointSmallModel3.dispose();
    dataPointSmallModel4.dispose();
    dataPointSmallModel5.dispose();
    dataPointSmallModel6.dispose();
    dataPointSmallModel7.dispose();
    dataPointSmallModel8.dispose();
    dataPointSmallModel9.dispose();
  }
}
