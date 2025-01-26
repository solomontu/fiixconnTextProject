import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.padding = EdgeInsets.zero,
    this.borderRadius,
    this.alignment,
    this.onPressed,
    this.child,
    this.onLongPress,
    this.backgroundColor,
    this.hoverColor = Colors.transparent,
    this.splashColor = Colors.transparent,
    this.focusColor = Colors.transparent,
    this.width,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.onTapDown,
    this.isDisabled = false,
    this.title,
    this.titleColor,
  });

  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Function(TapDownDetails)? onTapDown;
  final Widget? child;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? focusColor;
  final double? width;
  final Color? borderColor;
  final double? borderWidth;
  final double? height;
  final AlignmentGeometry? alignment;
  final bool isDisabled;
  final Color? titleColor;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          onLongPress: () => onLongPress,
          onTapDown: onTapDown,
          hoverColor: hoverColor,
          splashColor: splashColor,
          focusColor: focusColor,
          child: Container(
            padding: padding,
            width: width ?? 153.5.w,
            height: height ?? 48.h,
            alignment: alignment ?? Alignment.center,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
              color: backgroundColor ?? colors.secondaryColor,
              border: Border.all(
                color: borderColor ?? Colors.transparent,
                width: borderWidth ?? 1,
              ),
            ),
            child: child ??
                Styles.medium(title ?? '',
                    color: titleColor ?? colors.secondaryColor,
                    fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
