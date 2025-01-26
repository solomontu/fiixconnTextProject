import 'package:flutter/material.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/core/services/app_service_manager.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => as.routerService.getPop(),
      child: Icon(
        Icons.arrow_circle_left_outlined,
        color: color ?? colors.offBlack,
        size: 24,
      ),
    );
  }
}
