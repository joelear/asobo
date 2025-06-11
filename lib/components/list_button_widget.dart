import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'list_button_model.dart';
export 'list_button_model.dart';

class ListButtonWidget extends StatefulWidget {
  const ListButtonWidget({
    super.key,
    required this.action,
    required this.icon,
    required this.primaryText,
    this.secondaryText,
  });

  final Future Function()? action;
  final Widget? icon;
  final String? primaryText;
  final String? secondaryText;

  @override
  State<ListButtonWidget> createState() => _ListButtonWidgetState();
}

class _ListButtonWidgetState extends State<ListButtonWidget> {
  late ListButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListButtonModel());
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
        height: 75.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    widget.icon!,
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.primaryText,
                              'Primary text',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Mona Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          if (widget.secondaryText != null &&
                              widget.secondaryText != '')
                            Text(
                              valueOrDefault<String>(
                                widget.secondaryText,
                                'Secondary text',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mona Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                        ].divide(SizedBox(height: 2.0)),
                      ),
                    ),
                    Icon(
                      FFIcons.kproperty1ChevronRight,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).line1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
