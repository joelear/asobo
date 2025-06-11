import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'simple_list_item_model.dart';
export 'simple_list_item_model.dart';

class SimpleListItemWidget extends StatefulWidget {
  const SimpleListItemWidget({
    super.key,
    this.string,
    this.integer,
  });

  final String? string;
  final int? integer;

  @override
  State<SimpleListItemWidget> createState() => _SimpleListItemWidgetState();
}

class _SimpleListItemWidgetState extends State<SimpleListItemWidget> {
  late SimpleListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimpleListItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Text(
          valueOrDefault<String>(
            () {
              if (widget.string != null && widget.string != '') {
                return widget.string;
              } else if (widget.integer != null) {
                return widget.integer?.toString();
              } else {
                return '-';
              }
            }(),
            '-',
          ),
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Mona Sans',
                letterSpacing: 0.0,
              ),
        ),
      ),
    );
  }
}
