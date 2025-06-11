import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';
import 'profile_image_model.dart';
export 'profile_image_model.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({
    super.key,
    this.imageUrl,
    this.imageBlurHash,
    required this.size,
  });

  final String? imageUrl;
  final String? imageBlurHash;
  final CircleImageSize? size;

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  late ProfileImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000.0),
      child: Container(
        width: valueOrDefault<double>(
          () {
            if (widget.size == CircleImageSize.large64) {
              return 64.0;
            } else if (widget.size == CircleImageSize.medium48) {
              return 48.0;
            } else if (widget.size == CircleImageSize.xxl96) {
              return 96.0;
            } else {
              return 32.0;
            }
          }(),
          48.0,
        ),
        height: valueOrDefault<double>(
          () {
            if (widget.size == CircleImageSize.large64) {
              return 64.0;
            } else if (widget.size == CircleImageSize.medium48) {
              return 48.0;
            } else if (widget.size == CircleImageSize.xxl96) {
              return 96.0;
            } else {
              return 32.0;
            }
          }(),
          48.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(1000.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: OctoImage(
            placeholderBuilder: (_) => SizedBox.expand(
              child: Image(
                image: BlurHashImage(widget.imageBlurHash!),
                fit: BoxFit.cover,
              ),
            ),
            image: CachedNetworkImageProvider(
              (widget.imageUrl != null && widget.imageUrl != '') &&
                      (widget.imageUrl != '')
                  ? widget.imageUrl!
                  : 'https://fnadwhzjturpkenvxsat.supabase.co/storage/v1/object/public/profile_images/Blank%20Prof%20Image.png',
            ),
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
