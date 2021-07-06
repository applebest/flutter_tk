
import 'package:flutter/material.dart';
import 'package:fluttertuike/utils/image_utils.dart';
import 'package:fluttertuike/utils/image_utils.dart';

class LoadAssetImage extends StatelessWidget {


  final String image;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final ImageFormat format;
  final Color? color;


  const LoadAssetImage(this.image, {
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.format = ImageFormat.png,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageUtils.getImgPath(image),
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
    );
  }
}
