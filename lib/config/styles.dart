import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_constants/global_variables.dart';

class FWt {
  FWt();

  // static FontWeight extraLight = FontWeight.w200;
  // static FontWeight light = FontWeight.w300;
  static FontWeight normal = FontWeight.w400;
  static FontWeight mediumBold = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;

  static FontWeight bold = FontWeight.w700;
// static FontWeight extraBold = FontWeight.w800;
// static FontWeight text = FontWeight.w900;
}

class Styles {
  Styles();

  static TextStyle regularTextStyle({
    double? fontSize,
    Color? color,
    double? height,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextOverflow? textOverflow,
    bool strike = false,
    bool underline = false,
  }) {
    return TextStyle(
      fontSize: fontSize ?? 14.0,
      fontWeight: fontWeight ?? FWt.normal,
      color: color ?? colors.black,
      height: height,
      fontStyle: fontStyle,
      overflow: textOverflow,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: 'Lato',
    );
  }

  static Text regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    double? height,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
    bool? softWrap,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      softWrap: softWrap ?? true,
      textScaler: TextScaler.linear(0.8),
      style: regularTextStyle(
          color: color,
          fontSize: fontSize,
          fontStyle: fontStyle,
          height: height,
          fontWeight: fontWeight,
          strike: strike,
          underline: underline),
    );
  }

  static Text bold(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    double? height,
    bool? softWrap,
    FontWeight? fontWeight,
  }) {
    return Text(
      text,
      softWrap: softWrap ?? false,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: overflow,
      textScaler: TextScaler.linear(0.8),
      style: boldTextStyle(
          fontWight: fontWeight,
          fontSize: fontSize,
          height: height,
          color: color,
          strike: strike),
    );
  }

  static TextStyle boldTextStyle(
      {FontWeight? fontWight,
      double? fontSize,
      double? height,
      Color? color,
      bool strike = false}) {
    return TextStyle(
      fontSize: fontSize ?? 18.0,
      fontWeight: fontWight ?? FWt.bold,
      color: color ?? colors.black,
      height: height,
      decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      fontFamily: 'Lato',
    );
  }

  static Text medium(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextAlign? align,
    double? height,
    bool strike = false,
    int? lines,
    TextOverflow? overflow,
    bool underline = false,
    String fontFamily = 'Lato',
    bool? softWrap,
  }) {
    return Text(text,
        textAlign: align ?? TextAlign.left,
        maxLines: lines,
        overflow: overflow,
        softWrap: softWrap,
        textScaler: TextScaler.linear(0.8),
        style: mediumTextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height,
          underline: underline,
          color: color,
          strike: strike,
        ));
  }

  static TextStyle mediumTextStyle(
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      double? height,
      bool underline = false,
      bool strike = false,
      String fontFamily = 'Lato'}) {
    return TextStyle(
      fontSize: fontSize ?? 14.0.sp,
      fontWeight: fontWeight ?? FWt.mediumBold,
      color: color ?? colors.black,
      height: height,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: fontFamily,
    );
  }

  static Text semiBold(
    String text, {
    double? fontSize,
    Color? color,
    TextOverflow? overflow,
    TextAlign? align,
    double? height,
    bool? strike = false,
    bool underline = false,
    int? lines,
    String fontFamily = 'Lato',
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.linear(0.8),
      style: semiBoldTextStyles(
          fontSize: fontSize,
          color: color,
          height: height,
          underline: underline,
          textOverflow: overflow,
          strike: strike!,
          fontFamily: fontFamily),
    );
  }

  static TextStyle semiBoldTextStyles(
      {double? fontSize,
      Color? color,
      double? height,
      bool underline = false,
      TextOverflow? textOverflow,
      bool strike = false,
      String? fontFamily}) {
    return TextStyle(
      fontSize: fontSize ?? 16.0.sp,
      fontWeight: FWt.semiBold,
      color: color ?? colors.black,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      height: height,
      decoration: underline
          ? TextDecoration.underline
          : strike
              ? TextDecoration.lineThrough
              : TextDecoration.none,
      fontFamily: fontFamily,
    );
  }
}
