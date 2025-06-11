import '/backend/schema/structs/index.dart';
import '/components/connection_list_widget.dart';
import '/components/page_header/page_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'connection_picker_sheet_model.dart';
export 'connection_picker_sheet_model.dart';

class ConnectionPickerSheetWidget extends StatefulWidget {
  const ConnectionPickerSheetWidget({
    super.key,
    this.tapListAction,
    required this.confirmAction,
  });

  final Future Function(UserConnectionStruct connection)? tapListAction;
  final Future Function()? confirmAction;

  @override
  State<ConnectionPickerSheetWidget> createState() =>
      _ConnectionPickerSheetWidgetState();
}

class _ConnectionPickerSheetWidgetState
    extends State<ConnectionPickerSheetWidget> {
  late ConnectionPickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConnectionPickerSheetModel());
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
          mainAxisSize: MainAxisSize.max,
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
                titleText: 'Select players',
                actionText: 'Cancel',
                hideLine: true,
                backAction: () async {},
                action: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.connectionListModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ConnectionListWidget(
                        tapAction: (connection) async {
                          await widget.tapListAction?.call(
                            connection,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 24.0,
              decoration: BoxDecoration(),
            ),
          ],
        ),
      ),
    );
  }
}
