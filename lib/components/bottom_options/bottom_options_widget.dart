import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'bottom_options_model.dart';
export 'bottom_options_model.dart';

class BottomOptionsWidget extends StatefulWidget {
  const BottomOptionsWidget({
    super.key,
    bool? primaryVisible,
    bool? secondaryVisible,
    bool? tertiaryVisible,
    this.primaryText,
    this.secondaryText,
    this.tertiaryText,
    this.primaryAction,
    this.secondaryAction,
    this.tertiaryAction,
  })  : this.primaryVisible = primaryVisible ?? true,
        this.secondaryVisible = secondaryVisible ?? false,
        this.tertiaryVisible = tertiaryVisible ?? false;

  final bool primaryVisible;
  final bool secondaryVisible;
  final bool tertiaryVisible;
  final String? primaryText;
  final String? secondaryText;
  final String? tertiaryText;
  final Future Function()? primaryAction;
  final Future Function()? secondaryAction;
  final Future Function()? tertiaryAction;

  @override
  State<BottomOptionsWidget> createState() => _BottomOptionsWidgetState();
}

class _BottomOptionsWidgetState extends State<BottomOptionsWidget> {
  late BottomOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomOptionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.primaryVisible)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.primaryAction?.call();
                      },
                      text: widget.primaryText!,
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Mona Sans',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  if (widget.secondaryVisible == true)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.secondaryAction?.call();
                      },
                      text: widget.secondaryText!,
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondary,
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
                  if (widget.tertiaryVisible)
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.tertiaryAction?.call();
                      },
                      text: widget.tertiaryText!,
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 56.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 16.0),
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
                ].divide(SizedBox(height: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
