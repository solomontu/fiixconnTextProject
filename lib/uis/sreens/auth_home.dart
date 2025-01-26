import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/app_strings.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/app_constants/route_paths.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/core/services/app_service_manager.dart';
import 'package:uitest/uis/widgets/buttons/custom_buttons.dart';
import 'package:uitest/uis/widgets/buttons/custom_dropdown_button.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({super.key});

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  String dropdownValue = Constants.language.first;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          CustomImageAsset(
            assetName: Assets.authHomeBackground,
            fit: BoxFit.cover,
          ),
          SurfaceItems(
            dropdownValue: dropdownValue,
            onChanged: (value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          )
        ],
      ),
    );
  }
}

class SurfaceItems extends StatelessWidget {
  const SurfaceItems(
      {super.key, required this.dropdownValue, required this.onChanged});

  final String dropdownValue;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 40.0.h),
                child:
                CustomDropDownButton(
                  dropdownValue: dropdownValue,
                  onChanged: onChanged,
                  dropdownMenuItem: Constants.language
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Styles.medium(value,
                          fontSize: 12.sp, color: colors.white),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: CustomImageAsset(
                assetName: Assets.appIconWhite,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0.w, bottom: 20.h),
                    child: CustomButton(
                      backgroundColor: colors.white,
                      title: Strings.login,
                      titleColor: colors.secondaryColor,
                      onPressed: () {
                        as.routerService.getTo(Routes.login);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0.w, bottom: 20.h),
                    child: CustomButton(
                      alignment: Alignment.center,
                      backgroundColor: colors.secondaryColor,
                      title: Strings.signup,
                      titleColor: colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
