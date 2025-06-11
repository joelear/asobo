import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'tab_pill_model.dart';
export 'tab_pill_model.dart';

class TabPillWidget extends StatefulWidget {
  const TabPillWidget({
    super.key,
    bool? selected,
    required this.text,
  }) : this.selected = selected ?? false;

  final bool selected;
  final String? text;

  @override
  State<TabPillWidget> createState() => _TabPillWidgetState();
}

class _TabPillWidgetState extends State<TabPillWidget> {
  late TabPillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabPillModel());
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
        color: valueOrDefault<Color>(
          widget.selected
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).primaryBackground,
          FlutterFlowTheme.of(context).primaryText,
        ),
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).primaryText,
          width: widget.selected ? 0.0 : 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 8.0),
        child: Text(
          valueOrDefault<String>(
            widget.text,
            'Text',
          ),
          style: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Mona Sans',
                color: valueOrDefault<Color>(
                  widget.selected
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).primaryText,
                  FlutterFlowTheme.of(context).primaryBackground,
                ),
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
