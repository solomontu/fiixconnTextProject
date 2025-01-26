import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';

class BuildProfilePicture extends StatelessWidget {
  const BuildProfilePicture({super.key, this.height, this.width, this.onTap});

  final double? height;
  final double? width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: height ?? 40.h,
        width: width ?? 40.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.5, color: colors.white)),
        child: CustomImageAsset(assetName: Assets.fineGirls),
      ),
    );
  }
}
