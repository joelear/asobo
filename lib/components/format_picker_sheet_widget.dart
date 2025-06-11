import '/backend/schema/enums/enums.dart';
import '/components/page_header/page_header_widget.dart';
import '/components/simple_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'format_picker_sheet_model.dart';
export 'format_picker_sheet_model.dart';

class FormatPickerSheetWidget extends StatefulWidget {
  const FormatPickerSheetWidget({
    super.key,
    this.tapListAction,
  });

  final Future Function(RoundFormat format)? tapListAction;

  @override
  State<FormatPickerSheetWidget> createState() =>
      _FormatPickerSheetWidgetState();
}

class _FormatPickerSheetWidgetState extends State<FormatPickerSheetWidget> {
  late FormatPickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FormatPickerSheetModel());
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
                titleText: 'Select format',
                actionText: 'Cancel',
                hideLine: true,
                backAction: () async {},
                action: () async {
                  Navigator.pop(context);
                },
              ),
            ),
            Builder(
              builder: (context) {
                final roundFormat = RoundFormat.values.toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(roundFormat.length, (roundFormatIndex) {
                    final roundFormatItem = roundFormat[roundFormatIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.tapListAction?.call(
                          roundFormatItem,
                        );
                      },
                      child: wrapWithModel(
                        model: _model.simpleListItemModels.getModel(
                          roundFormatItem.name,
                          roundFormatIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: SimpleListItemWidget(
                          key: Key(
                            'Keycyr_${roundFormatItem.name}',
                          ),
                          string: functions
                              .convertCamelCaseToTitle(roundFormatItem.name),
                        ),
                      ),
                    );
                  }),
                );
              },
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
