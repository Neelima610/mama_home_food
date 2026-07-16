import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final image = imagePath.startsWith('http')
        ? Image.network(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (_, _, _) =>
                const Icon(Icons.broken_image),
          )
        : Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
          );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}