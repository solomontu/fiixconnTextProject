import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/app_strings.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:uitest/app_constants/global_variables.dart';
import 'package:uitest/config/styles.dart';
import 'package:uitest/data/controllers/video_player_ctr.dart';
import 'package:uitest/data/models/appbar_text_items_model.dart';
import 'package:uitest/data/models/reaction_button_model.dart';
import 'package:uitest/uis/widgets/buttons/custom_dropdown_button.dart';
import 'package:uitest/uis/widgets/custom_image_asset.dart';
import 'package:uitest/uis/widgets/profile_picture_builder.dart';
import 'package:video_player/video_player.dart';

class Feeds extends StatefulWidget {
  const Feeds({super.key});

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  late List<AppbarTextItemsModelModel> appbarTextButtons;
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    Get.put(VideoPlayerCtr());
    appbarTextButtons = List.from(Constants.appBarWidgetOptions);
    selectedIndex = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.blueGreen,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15.h),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              CustomAppBar(
                  appbarActionTexts: appbarTextButtons
                      .asMap()
                      .entries
                      .map(
                        (item) => AppbarTextItem(
                          name: item.value.name,
                          isClicked: item.value.isClicked,
                          onTap: () {
                            selectedIndex = item.key;
                            for (var item in appbarTextButtons) {
                              item.isClicked = false;
                              item.name = item.name;
                            }

                            for (var i in appbarTextButtons) {
                              if (i.name == item.value.name) {
                                i.isClicked = true;
                                i.name = i.name;
                              }
                            }
                            setState(() {});
                          },
                        ),
                      )
                      .toList()),
              Expanded(
                flex: 1,
                child: IndexedStack(
                    index: selectedIndex,
                    children: Constants.appbarScreenOptions),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerBuilder extends StatelessWidget {
  VideoPlayerBuilder({super.key});

  final VideoPlayerCtr videoPlayerCtr = Get.find<VideoPlayerCtr>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = videoPlayerCtr.videoController.value;
      if (controller == null || !controller.value.isInitialized) {
        return SizedBox(
          height: 200.h,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      return Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              videoPlayerCtr.playOrPauseVideo();
            }, // Toggle play/pause
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 2.0,
                overlayShape: SliderComponentShape.noOverlay,
                thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 4.0, disabledThumbRadius: 4),
                trackShape: RectangularSliderTrackShape(),
                // Custom track shape without padding
              ),
              child: Slider(
                activeColor: colors.white,
                inactiveColor: colors.white,
                thumbColor: colors.white,
                value: controller.value.position.inSeconds.toDouble(),
                max: controller.value.duration.inSeconds.toDouble(),
                min: 0,
                onChanged: (newValue) {
                  controller.seekTo(Duration(seconds: newValue.toInt()));
                },
              ),
            ),
          ),
          Positioned(right: 20.w, bottom: 20.h, child: VideoUserReactions()),
          Positioned(
              left: 20.w,
              bottom: 20.h,
              right: 0,
              child: EffectBuilder(
                userName: Strings.userName,
                onTap: () {},
                description: Strings.description,
              )),
        ],
      );
    });
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.appbarActionTexts});

  final List<Widget> appbarActionTexts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 79,
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.menu, color: colors.white))),
          Expanded(
              flex: 176,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...appbarActionTexts],
              )),
          Expanded(
              flex: 79,
              child: Align(
                  alignment: Alignment.topRight,
                  child: CustomSvgAsset(assetName: Assets.search))),
        ],
      ),
    );
  }
}

class AppbarTextItem extends StatelessWidget {
  const AppbarTextItem({
    super.key,
    required this.name,
    required this.isClicked,
    required this.onTap,
  });

  final String name;
  final bool isClicked;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name,
            style: isClicked
                ? Styles.boldTextStyle(fontSize: 12.sp, color: colors.white)
                : Styles.mediumTextStyle(fontSize: 12.sp, color: colors.white),
          ),
          if (isClicked)
            Container(
              width: 24.w,
              decoration: BoxDecoration(
                  color: colors.white,
                  border: Border.all(color: colors.white, width: 2.w)),
            )
        ],
      ),
    );
  }
}

class VideoUserReactions extends StatelessWidget {
  const VideoUserReactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BuildProfilePicture(),
        for (ReactionButtonModel i in Constants.reactionItems)
          BuildReactionButtons(
            text: i.count,
            icon: i.iconName,
            onTap: () {},
          ),
        CustomImageAsset(assetName: Assets.miniMusicSquare)
      ],
    );
  }
}

class BuildReactionButtons extends StatelessWidget {
  const BuildReactionButtons(
      {super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSvgAsset(assetName: icon),
            Padding(
              padding: EdgeInsets.only(top: 2.0.h),
              child: Styles.bold(text, fontSize: 10.sp, color: colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class EffectBuilder extends StatelessWidget {
  const EffectBuilder({
    super.key,
    required this.description,
    required this.onTap,
    required this.userName,
  });

  final String description;
  final String userName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ShopDropdown(),
          ),
          Styles.semiBold(userName, fontSize: 14.sp, color: colors.white),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: RichText(
              text: TextSpan(
                text: '$description!...',
                style: Styles.mediumTextStyle(
                    color: colors.white, fontSize: 12.sp),
                children: [
                  TextSpan(
                    text: Strings.seeMore, // Dynamic name
                    style: Styles.semiBoldTextStyles(
                        color: colors.white, fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              EffectContainer(
                width: 150.w,
                text: 'False . Many (featuring',
                iconName: Assets.music,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: EffectContainer(
                  width: 104.w,
                  text: 'Effect name',
                  iconName: Assets.magicPen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShopDropdown extends StatelessWidget {
  const ShopDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final VideoPlayerCtr videoPlayerCtr = Get.find<VideoPlayerCtr>();
    return Obx(() => Container(
          height: 26.h,
          decoration: BoxDecoration(
            color: colors.black2,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0.h, bottom: 8.0.h, left: 5.w, right: 5.w),
                child: CustomSvgAsset(
                  assetName: Assets.shop,
                ),
              ),
              CustomDropDownButton<String>(
                iconData: Icons.keyboard_arrow_down_rounded,
                onChanged: videoPlayerCtr.dropDownOnChanged,
                dropdownValue: videoPlayerCtr.dropDownValue.value,
                dropdownMenuItem: Constants.shops
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Styles.medium(value,
                        fontSize: 12.sp, color: colors.white),
                  );
                }).toList(),
              ),
            ],
          ),
        ));
  }
}

class EffectContainer extends StatelessWidget {
  const EffectContainer(
      {super.key,
      required this.width,
      required this.text,
      required this.iconName});

  final double width;
  final String text;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      width: width.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: colors.textColor1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: CustomSvgAsset(assetName: iconName),
          ),
          Styles.medium(text,
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              color: colors.white),
        ],
      ),
    );
  }
}
