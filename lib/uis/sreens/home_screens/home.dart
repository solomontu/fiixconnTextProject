import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 2;

  void onItemTapped(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Constants.homeWidgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBarExample(
        selectedIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample(
      {super.key, required this.onTap, required this.selectedIndex});

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: CustomSvgAsset(assetName: Assets.layer),
          activeIcon: SelectedIcon(svgAsset: Assets.layer),
          label: 'Mini Apps',
          backgroundColor: colors.black,
        ),
        BottomNavigationBarItem(
          icon: CustomSvgAsset(assetName: Assets.chat),
          activeIcon: SelectedIcon(svgAsset: Assets.chat),
          label: 'Messages',
          backgroundColor: colors.black,
        ),
        BottomNavigationBarItem(
          icon: FeedsIcon(),
          activeIcon: SelectedIcon(iconData: Icons.add_rounded),
          label: 'Feeds',
          backgroundColor: colors.black,
        ),
        BottomNavigationBarItem(
          icon: CustomSvgAsset(assetName: Assets.notification),
          activeIcon: SelectedIcon(svgAsset: Assets.notification),
          label: 'Notifications',
          backgroundColor: colors.black,
        ),
        BottomNavigationBarItem(
          icon: CustomSvgAsset(assetName: Assets.profile),
          activeIcon: SelectedIcon(svgAsset: Assets.profile),
          label: 'Profile',
          backgroundColor: colors.black,
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      unselectedFontSize: 10.sp,
      unselectedItemColor: colors.gray2,
    );
  }
}

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({super.key, this.iconData, this.svgAsset});

  final IconData? iconData;
  final String? svgAsset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 36.67,
          width: 36.67,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5ADBED),
                Color(0xFF29AED8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(13), // Optional
          ),
          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Color(0xFF007AFF),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors
                      .white, // Color here doesn't matter; shader overrides it.
                ),
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
        svgAsset != null
            ? CustomSvgAsset(
                assetName: svgAsset!,
                color: colors.white,
              )
            : Icon(
                iconData,
                color: colors.white,
              ),
      ],
    );
  }
}

class FeedsIcon extends StatelessWidget {
  const FeedsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add_rounded,
      color: colors.gray2,
    );
  }
}
