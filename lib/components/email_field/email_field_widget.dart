import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'email_field_model.dart';
export 'email_field_model.dart';

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({super.key});

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  late EmailFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailFieldModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();
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
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
              child: Text(
                'Email',
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Mona Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            child: TextFormField(
              controller: _model.emailTextController,
              focusNode: _model.emailFocusNode,
              autofocus: false,
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                isDense: false,
                alignLabelWithHint: false,
                hintText: 'Enter email',
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
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Mona Sans',
                    letterSpacing: 0.0,
                  ),
              keyboardType: TextInputType.emailAddress,
              cursorColor: FlutterFlowTheme.of(context).primaryText,
              validator:
                  _model.emailTextControllerValidator.asValidator(context),
            ),
          ),
        ],
      ),
    );
  }
}
