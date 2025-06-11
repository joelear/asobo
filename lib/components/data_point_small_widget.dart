import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'data_point_small_model.dart';
export 'data_point_small_model.dart';

class DataPointSmallWidget extends StatefulWidget {
  const DataPointSmallWidget({
    super.key,
    required this.title,
    required this.text,
  });

  final String? title;
  final String? text;

  @override
  State<DataPointSmallWidget> createState() => _DataPointSmallWidgetState();
}

class _DataPointSmallWidgetState extends State<DataPointSmallWidget> {
  late DataPointSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataPointSmallModel());
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valueOrDefault<String>(
              widget.title,
              'Title',
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Mona Sans',
                  color: FlutterFlowTheme.of(context).foreground3,
                  letterSpacing: 0.0,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.text,
                'Text',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Mona Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
