import '/backend/supabase/supabase.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/search_clubs_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'club_picker_sheet_model.dart';
export 'club_picker_sheet_model.dart';

class ClubPickerSheetWidget extends StatefulWidget {
  const ClubPickerSheetWidget({
    super.key,
    required this.selectClubAction,
  });

  final Future Function(ClubsRow club)? selectClubAction;

  @override
  State<ClubPickerSheetWidget> createState() => _ClubPickerSheetWidgetState();
}

class _ClubPickerSheetWidgetState extends State<ClubPickerSheetWidget> {
  late ClubPickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubPickerSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                titleText: 'Select club',
                actionText: 'Cancel',
                hideLine: true,
                backAction: () async {},
                action: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.searchClubsModel,
                updateCallback: () => safeSetState(() {}),
                child: SearchClubsWidget(
                  tapClubCallback: (clubRow, clubId) async {
                    await widget.selectClubAction?.call(
                      clubRow!,
                    );
                  },
                ),
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
