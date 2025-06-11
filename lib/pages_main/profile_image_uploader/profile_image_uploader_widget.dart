import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'profile_image_uploader_model.dart';
export 'profile_image_uploader_model.dart';

class ProfileImageUploaderWidget extends StatefulWidget {
  const ProfileImageUploaderWidget({super.key});

  @override
  State<ProfileImageUploaderWidget> createState() =>
      _ProfileImageUploaderWidgetState();
}

class _ProfileImageUploaderWidgetState
    extends State<ProfileImageUploaderWidget> {
  late ProfileImageUploaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImageUploaderModel());
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
        final selectedMedia = await selectMedia(
          storageFolderPath: currentUserUid,
          maxWidth: 300.00,
          maxHeight: 300.00,
          imageQuality: 50,
          includeBlurHash: true,
          mediaSource: MediaSource.photoGallery,
          multiImage: false,
        );
        if (selectedMedia != null &&
            selectedMedia
                .every((m) => validateFileFormat(m.storagePath, context))) {
          safeSetState(() => _model.isDataUploading_profileImageUpload = true);
          var selectedUploadedFiles = <FFUploadedFile>[];

          var downloadUrls = <String>[];
          try {
            selectedUploadedFiles = selectedMedia
                .map((m) => FFUploadedFile(
                      name: m.storagePath.split('/').last,
                      bytes: m.bytes,
                      height: m.dimensions?.height,
                      width: m.dimensions?.width,
                      blurHash: m.blurHash,
                    ))
                .toList();

            downloadUrls = await uploadSupabaseStorageFiles(
              bucketName: 'profile_images',
              selectedFiles: selectedMedia,
            );
          } finally {
            _model.isDataUploading_profileImageUpload = false;
          }
          if (selectedUploadedFiles.length == selectedMedia.length &&
              downloadUrls.length == selectedMedia.length) {
            safeSetState(() {
              _model.uploadedLocalFile_profileImageUpload =
                  selectedUploadedFiles.first;
              _model.uploadedFileUrl_profileImageUpload = downloadUrls.first;
            });
          } else {
            safeSetState(() {});
            return;
          }
        }
      },
      child: Container(
        width: 144.0,
        height: 144.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(
              valueOrDefault<String>(
                _model.uploadedFileUrl_profileImageUpload != ''
                    ? _model.uploadedFileUrl_profileImageUpload
                    : 'https://fnadwhzjturpkenvxsat.supabase.co/storage/v1/object/public/profile_images//white_profile_default.jpg',
                'https://fnadwhzjturpkenvxsat.supabase.co/storage/v1/object/public/profile_images//white_profile_default.jpg',
              ),
            ).image,
          ),
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).line1,
          ),
        ),
        child: Visibility(
          visible: _model.uploadedFileUrl_profileImageUpload == '',
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FFIcons.kproperty1Plus,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                child: Text(
                  'Add image',
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: 'Mona Sans',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
