import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset(
      {super.key, this.fit, required this.assetName, this.semanticLabel});

  final String assetName;
  final String? semanticLabel;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      semanticLabel: semanticLabel,
      fit: fit,
    );
  }
}

class CustomSvgAsset extends StatelessWidget {
  const CustomSvgAsset(
      {super.key, required this.assetName, this.semanticLabel, this.color});

  final String assetName;
  final String? semanticLabel;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      semanticsLabel: semanticLabel,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}
