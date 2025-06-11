import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet_options_model.dart';
export 'bottom_sheet_options_model.dart';

class BottomSheetOptionsWidget extends StatefulWidget {
  const BottomSheetOptionsWidget({
    super.key,
    this.button1Icon,
    this.button1Text,
    this.button1Action,
    this.button2Icon,
    this.button2Text,
    this.button2Action,
    this.button3Icon,
    this.button3Text,
    this.button3Action,
    bool? showButton1,
    bool? showButton2,
    bool? showButton3,
  })  : this.showButton1 = showButton1 ?? false,
        this.showButton2 = showButton2 ?? false,
        this.showButton3 = showButton3 ?? false;

  final Widget? button1Icon;
  final String? button1Text;
  final Future Function()? button1Action;
  final Widget? button2Icon;
  final String? button2Text;
  final Future Function()? button2Action;
  final Widget? button3Icon;
  final String? button3Text;
  final Future Function()? button3Action;
  final bool showButton1;
  final bool showButton2;
  final bool showButton3;

  @override
  State<BottomSheetOptionsWidget> createState() =>
      _BottomSheetOptionsWidgetState();
}

class _BottomSheetOptionsWidgetState extends State<BottomSheetOptionsWidget> {
  late BottomSheetOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetOptionsModel());
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
      height: 270.0,
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
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
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
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.showButton1)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.button1Action?.call();
                      },
                      text: widget.button1Text!,
                      icon: widget.button1Icon,
                      options: FFButtonOptions(
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 24.0, 16.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00EEEEEE),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  if (widget.showButton2)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.button2Action?.call();
                      },
                      text: widget.button2Text!,
                      icon: widget.button2Icon,
                      options: FFButtonOptions(
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 24.0, 16.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00EEEEEE),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  if (widget.showButton3)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.button3Action?.call();
                      },
                      text: widget.button3Text!,
                      icon: widget.button3Icon,
                      options: FFButtonOptions(
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 24.0, 16.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x00EEEEEE),
                        textStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                              fontFamily: 'Mona Sans',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                ]
                    .divide(SizedBox(height: 0.0))
                    .addToStart(SizedBox(height: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
