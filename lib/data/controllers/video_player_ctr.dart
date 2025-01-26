import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:uitest/app_constants/app_assets.dart';
import 'package:uitest/app_constants/const.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCtr extends GetxController {
  Rxn<VideoPlayerController> videoController = Rxn<VideoPlayerController>();

  RxString dropDownValue = Constants.shops.first.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVideo();
  }

  Future<void> initializeVideo() async {
    try {
      final controller = VideoPlayerController.asset(Assets.sampleVideo);
      await controller.initialize();
      videoController.value = controller;
      controller.addListener(() {
        videoController.refresh(); // Notify GetX observers
      });
      videoController.refresh();
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
  }

  void playOrPauseVideo() {
    final controller = videoController.value;
    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
      videoController.refresh(); // Notify observers about play/pause
    }
  }

  @override
  void onClose() {
    videoController.value?.dispose();
    super.onClose();
  }

  dropDownOnChanged(String? newValue) {
    dropDownValue.value = newValue??'';
  }
}
