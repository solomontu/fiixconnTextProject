// ignore_for_file: implementation_imports

import 'package:get/get.dart';

class RouterService {
  RouterService();

  ///To navigate to nextScreen
  void getTo<T>(
    String pathName, {
    Map<String, String>? params = const <String, String>{},
    T? arguments,
  }) {
    Get.toNamed(pathName, parameters: params, arguments: arguments);
  }

  ///To navigate and remove the previous screen from the tree.
  void getOff<T>(String path, {T? arguments}) {
    Get.offNamed(path, arguments: arguments);
  }

  ///To navigate and remove all previous screens from the tree.
  void getOffAll<T>(String pathName, {T? arguments}) {
    Get.offAllNamed(pathName, arguments: arguments);
  }

  /// Simple pop
  void getPop() {
    Get.back();
  }
}
