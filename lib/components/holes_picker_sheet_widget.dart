import '/components/page_header/page_header_widget.dart';
import '/components/simple_list_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'holes_picker_sheet_model.dart';
export 'holes_picker_sheet_model.dart';

class HolesPickerSheetWidget extends StatefulWidget {
  const HolesPickerSheetWidget({
    super.key,
    this.selectHolesAction,
  });

  final Future Function(int holesInt)? selectHolesAction;

  @override
  State<HolesPickerSheetWidget> createState() => _HolesPickerSheetWidgetState();
}

class _HolesPickerSheetWidgetState extends State<HolesPickerSheetWidget> {
  late HolesPickerSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HolesPickerSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                titleText: 'Select holes',
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
                final holes = FFAppState().holesOptions.toList();

                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(holes.length, (holesIndex) {
                    final holesItem = holes[holesIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.selectHolesAction?.call(
                          holesItem,
                        );
                      },
                      child: wrapWithModel(
                        model: _model.simpleListItemModels.getModel(
                          holesItem.toString(),
                          holesIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: SimpleListItemWidget(
                          key: Key(
                            'Keytr4_${holesItem.toString()}',
                          ),
                          string: holesItem.toString(),
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
