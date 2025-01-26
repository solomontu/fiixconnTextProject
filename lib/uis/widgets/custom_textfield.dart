import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/config/styles.dart';

import '../../app_constants/global_variables.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.height,
      this.width,
      this.hintText,
      this.border,
      this.prefixIconConstraints,
      this.enableBorder,
      this.prefixIcon,
      this.focusedBorder,
      this.contentPadding,
      this.fillColor,
      this.hintStyle,
      this.controller,
      this.suffixIconConstraints,
      this.suffixIcon,
      this.maxLength,
      super.key,
      this.maxLines,
      this.validator,
      this.keyboardType,
      this.suffix,
      this.obscureText,
      this.focusNode,
      this.onChanged});

  final double? height;
  final Widget? prefixIcon;
  final double? width;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final OutlineInputBorder? border;
  final EdgeInsets? contentPadding;
  final OutlineInputBorder? enableBorder;
  final OutlineInputBorder? focusedBorder;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ?? 335.w,
      child: TextFormField(
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        validator: validator,
        autofocus: false,
        controller: controller,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        style: Styles.regularTextStyle(fontSize: 14.sp),
        onChanged: onChanged,
        decoration: InputDecoration(
            // height: height ?? 40.h,
            filled: true,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            fillColor: fillColor ?? colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            suffix: suffix,
            enabledBorder: enableBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: colors.secondaryColor)),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: colors.secondaryColor)),
            border: border ??
                OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: colors.secondaryColor)),
            hintText: hintText,
            hintStyle: hintStyle ?? Styles.regularTextStyle(fontSize: 14.sp)),
      ),
    );
  }
}
