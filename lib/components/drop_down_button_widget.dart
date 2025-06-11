import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'drop_down_button_model.dart';
export 'drop_down_button_model.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({
    super.key,
    this.fieldTitle,
    this.icon,
    this.hint,
    this.selectedOption,
    bool? showSelected,
    this.action,
  }) : this.showSelected = showSelected ?? false;

  final String? fieldTitle;
  final Widget? icon;
  final String? hint;
  final String? selectedOption;
  final bool showSelected;
  final Future Function()? action;

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  late DropDownButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DropDownButtonModel());
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
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
            child: Text(
              valueOrDefault<String>(
                widget.fieldTitle,
                '-',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Mona Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await widget.action?.call();
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).line1,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: widget.icon!,
                    ),
                    Expanded(
                      child: Text(
                        valueOrDefault<String>(
                          widget.showSelected
                              ? widget.selectedOption
                              : widget.hint,
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Mona Sans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Icon(
                      FFIcons.kproperty1ChevronUp,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 18.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
