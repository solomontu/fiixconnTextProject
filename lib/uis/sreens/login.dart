import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/app_keys.dart';
import 'package:uitest/app_constants/app_strings.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/app_constants/route_paths.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/core/services/app_service_manager.dart';
import 'package:uitest/helpers/validator.dart';
import 'package:uitest/uis/widgets/buttons/custom_back_button.dart';
import 'package:uitest/uis/widgets/buttons/custom_buttons.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';
import 'package:uitest/uis/widgets/custom_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  TextEditingController userNameCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Brightness appMode = MediaQuery.of(context).platformBrightness;
    return Material(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.h, 3.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomBackButton(),
              ),
              Expanded(
                flex: 145,
                child: CustomImageAsset(
                  assetName: appMode == Brightness.dark
                      ? Assets.appIconWhite
                      : Assets.appIconBlue,
                ),
              ),
              Expanded(
                flex: 270,
                child: LoginForm(
                  passwordCtr: passwordCtr,
                  userNameCtr: userNameCtr,
                  obscureText: obscureText,
                  suffixIcon: ObscureTextButton(
                    onTap: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    isObscured: obscureText,
                  ),
                ),
              ),
              CustomButton(
                width: 335.w,
                title: Strings.createNewAccount,
                backgroundColor: colors.white,
                titleColor: colors.secondaryColor,
                borderColor: colors.gray,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm(
      {super.key,
      this.obscureText,
      this.suffixIcon,
      required this.passwordCtr,
      required this.userNameCtr});

  final TextEditingController userNameCtr;
  final TextEditingController passwordCtr;
  final bool? obscureText;
  final Widget? suffixIcon;
  final _logInformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Form(
        key: _logInformKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextInput(
              label: Strings.userName,
              controller: userNameCtr,
              validator: (value) {
                return NameValidator.validate(value ?? Keys.empty);
              },
            ),
            CustomTextInput(
              label: Strings.password,
              controller: passwordCtr,
              obscureText: obscureText,
              suffixIcon: suffixIcon,
              validator: (value) {
                return PasswordValidator.validate(value ?? Keys.empty);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0.h),
              child: CustomButton(
                width: 335.w,
                title: Strings.login,
                titleColor: colors.white,
                onPressed: () {
                  if (_logInformKey.currentState!.validate()) {
                    as.routerService.getOffAll(Routes.home);
                  }
                },
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Styles.semiBold(
                Strings.forgottenPassword,
                color: brightness == Brightness.dark
                    ? colors.white
                    : colors.secondaryColor,
              ),
            )
          ],
        ));
  }
}

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {super.key,
      required this.label,
      this.validator,
      this.controller,
      this.obscureText,
      this.suffixIcon});

  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.medium(label,
                      fontSize: 12.sp, color: colors.textColor1),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Styles.medium('*',
                          fontSize: 12.sp, color: colors.red)),
                ],
              ),
            ),
          ),
          CustomTextField(
            validator: validator,
            controller: controller,
            suffixIcon: suffixIcon,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}

class ObscureTextButton extends StatelessWidget {
  const ObscureTextButton(
      {super.key, required this.onTap, required this.isObscured});

  final void Function() onTap;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          isObscured ? Icons.visibility : Icons.visibility_off,
          size: 16,
          color: colors.offBlack,
        ));
  }
}
