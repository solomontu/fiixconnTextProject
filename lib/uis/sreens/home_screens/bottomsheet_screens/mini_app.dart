import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/app_strings.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/uis/widgets/buttons/custom_back_button.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';
import 'package:uitest/uis/widgets/profile_picture_builder.dart';

class MiniApp extends StatefulWidget {
  const MiniApp({super.key});

  @override
  State<MiniApp> createState() => _MiniAppState();
}

class _MiniAppState extends State<MiniApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode
          ? ThemeData.dark().copyWith(
              primaryColor: colors.black,
              scaffoldBackgroundColor: colors.white,
            )
          : ThemeData.light().copyWith(
              primaryColor: colors.white,
              scaffoldBackgroundColor: Colors.white,
            ),
      child: Material(
        color: isDarkMode ? colors.black : colors.white,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBackButton(
                      color: isDarkMode ? colors.white : colors.textColor1,
                    ),
                    Styles.medium(Strings.miniApp,
                        fontSize: 16.sp,
                        color: isDarkMode ? colors.white : colors.textColor1),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MiniAppBarAction(
                            color:
                                isDarkMode ? colors.white : colors.textColor1,
                            onTap: () {},
                            assetName: Assets.search2),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: MiniAppBarAction(
                              color:
                                  isDarkMode ? colors.white : colors.textColor1,
                              onTap: () {},
                              assetName: Assets.ranking),
                        ),
                        BuildProfilePicture(
                          height: 24.h,
                          width: 24.w,
                          onTap: () {
                            isDarkMode = !isDarkMode;
                            setState(() {});
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.lightBlue,
                      margin: EdgeInsets.only(bottom: 20.h),
                      alignment: Alignment.topCenter,
                      height: 638.46.h,
                      width: double.infinity,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_upward_rounded),
                            Styles.bold(
                                "Please Scroll up and down to see full page",
                                color: isDarkMode
                                    ? colors.white
                                    : colors.textColor1),
                            Icon(Icons.arrow_downward_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Strings.trending,
                      subTitle: Strings.trendingGamesFor30Days,
                      color: isDarkMode ? colors.white : colors.textColor1,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: HorizontalScroller(isDarkMode: isDarkMode)),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Strings.categories,
                      color: isDarkMode ? colors.white : colors.textColor1,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        alignment: Alignment.topCenter,
                        height: 237.h,
                        width: 335.w,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              VerticalScroller(isDarkMode: isDarkMode)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Strings.recentlyOpened,
                      subTitle: Strings.hereAreSomeOfYourRecentlyOpenedGames,
                      color: isDarkMode ? colors.white : colors.textColor1,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                        padding:  EdgeInsets.only(bottom: 10.0.h),
                        child: HorizontalScroller(isDarkMode: isDarkMode),
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalScroller extends StatelessWidget {
  const VerticalScroller({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 192,
        direction: Axis.vertical,
        children: List.generate(
            10,
            (_) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VerticalItemBuilder(
                    title: 'Game 1',
                    subTitle: 'Hello game',
                    titleColor: isDarkMode ? colors.white : colors.textColor1,
                    subTitleColor: isDarkMode ? colors.white : colors.gray2,
                  ),
                )));
  }
}

class HorizontalScroller extends StatelessWidget {
  const HorizontalScroller({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.centerLeft,
                height: 143,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) => HorizontalItemBuilder(
                          itemName: 'Game 1',
                          color: isDarkMode ? colors.white : colors.textColor1,
                        ))),
          ),
        ],
      ),
    );
  }
}

class MiniAppBarAction extends StatelessWidget {
  const MiniAppBarAction(
      {super.key, required this.onTap, required this.assetName, this.color});

  final void Function() onTap;
  final String assetName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomSvgAsset(
        assetName: assetName,
        color: color,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key, required this.title, this.subTitle, required this.color});

  final String title;
  final String? subTitle;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.bold(title, fontSize: 14.sp, color: color),
          if (subTitle != null || subTitle == true)
            Styles.regular(subTitle!, fontSize: 12.sp, color: color),
        ],
      ),
    );
  }
}

class HorizontalItemBuilder extends StatelessWidget {
  const HorizontalItemBuilder(
      {super.key,
      this.height,
      this.width,
      required this.itemName,
      required this.color});

  final double? height;
  final double? width;
  final String itemName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height ?? 100.h,
            width: width ?? 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.lightBlue),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.0.h),
            child: Styles.medium(itemName, fontSize: 10.sp, color: color),
          )
        ],
      ),
    );
  }
}

class VerticalItemBuilder extends StatelessWidget {
  const VerticalItemBuilder(
      {super.key,
      this.height,
      this.width,
      required this.title,
      required this.subTitle,
      required this.titleColor,
      required this.subTitleColor});

  final double? height;
  final double? width;
  final String title;
  final String subTitle;
  final Color titleColor;
  final Color subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height ?? 64.h,
            width: width ?? 64.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.lightBlue),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.0.h),
                  child: Styles.bold(title, fontSize: 10.sp, color: titleColor),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0.h),
                  child: Styles.regular(subTitle,
                      fontSize: 10.sp, color: subTitleColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
