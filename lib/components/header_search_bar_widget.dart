import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'header_search_bar_model.dart';
export 'header_search_bar_model.dart';

class HeaderSearchBarWidget extends StatefulWidget {
  const HeaderSearchBarWidget({
    super.key,
    this.callbackActionOnChange,
  });

  final Future Function()? callbackActionOnChange;

  @override
  State<HeaderSearchBarWidget> createState() => _HeaderSearchBarWidgetState();
}

class _HeaderSearchBarWidgetState extends State<HeaderSearchBarWidget> {
  late HeaderSearchBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderSearchBarModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 300),
                  () async {
                    await widget.callbackActionOnChange?.call();
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  alignLabelWithHint: false,
                  hintText: 'Search',
                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Mona Sans',
                        color: FlutterFlowTheme.of(context).foreground3,
                        letterSpacing: 0.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  prefixIcon: Icon(
                    FFIcons.kproperty1Search,
                    color: FlutterFlowTheme.of(context).foreground3,
                    size: 18.0,
                  ),
                  suffixIcon: _model.textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.textController?.clear();
                            await widget.callbackActionOnChange?.call();
                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            size: 18.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyLarge.override(
                      fontFamily: 'Mona Sans',
                      letterSpacing: 0.0,
                    ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
          if ((_model.textFieldFocusNode?.hasFocus ?? false))
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await actions.removeFocus();
              },
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Cancel',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mona Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          if (!(_model.textFieldFocusNode?.hasFocus ?? false))
            Container(
              width: 16.0,
              height: 10.0,
              decoration: BoxDecoration(),
            ),
        ],
      ),
    );
  }
}
