import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.dropdownValue,
    required this.onChanged,
    required this.dropdownMenuItem,
    this.fontColor,
    this.fontSize,
    this.iconData,
  });

  final T dropdownValue;
  final Function(T?) onChanged;
  final Color? fontColor;
  final double? fontSize;
  final IconData? iconData;

  final List<DropdownMenuItem<T>> dropdownMenuItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
        isDense: true,
        value: dropdownValue,
        dropdownColor: colors.secondaryColor,
        style: Styles.mediumTextStyle(
            fontSize: fontSize ?? 12.sp, color: fontColor ?? colors.black),
        underline: SizedBox(),
        onChanged: onChanged,
        icon: Icon(
          iconData ?? Icons.arrow_drop_down, // Custom icon
          color: Colors.white,
        ),
        items: dropdownMenuItem);
  }
}
