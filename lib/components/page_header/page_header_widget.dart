import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'page_header_model.dart';
export 'page_header_model.dart';

class PageHeaderWidget extends StatefulWidget {
  const PageHeaderWidget({
    super.key,
    required this.backVisible,
    required this.titleVisible,
    required this.actionVisible,
    this.titleText,
    this.actionText,
    this.backAction,
    this.action,
    bool? hideLine,
  }) : this.hideLine = hideLine ?? false;

  final bool? backVisible;
  final bool? titleVisible;
  final bool? actionVisible;
  final String? titleText;
  final String? actionText;
  final Future Function()? backAction;
  final Future Function()? action;
  final bool hideLine;

  @override
  State<PageHeaderWidget> createState() => _PageHeaderWidgetState();
}

class _PageHeaderWidgetState extends State<PageHeaderWidget> {
  late PageHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageHeaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: widget.backVisible ?? true,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.backAction?.call();
                      },
                      child: Icon(
                        FFIcons.kproperty1ChevronLeft,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: widget.titleVisible ?? true,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.titleText,
                              'Title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Mona Sans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: Container(
                  height: 48.0,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: widget.actionVisible ?? true,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.action?.call();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.actionText,
                                  'Action',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Mona Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (widget.hideLine == false)
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
              ),
            ),
        ],
      ),
    );
  }
}
