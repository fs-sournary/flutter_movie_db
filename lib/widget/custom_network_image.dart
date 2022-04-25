import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/utils/constants.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.fit,
  }) : super(key: key);

  final String path;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: baseApiImage + path,
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidget: (context, url, error) {
            return Center(child: Text(S.current.network_image_error));
          },
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
