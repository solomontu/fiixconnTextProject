
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


String getReference() {
  String platform;
  if (Platform.isIOS) {
    platform = 'iOS';
  } else {
    platform = 'Android';
  }

  return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
}

class DimensionService{
  DimensionService();
  verticalSpace(context, factor) => SizedBox(height: height(context) * factor);

  horizontalSpace(context, factor) => SizedBox(width: width(context) * factor);

  tiny5VerticalSpace() => SizedBox(height: 5);

  tinyVerticalSpace() => SizedBox(height: 10);

  tiny15VerticalSpace() => SizedBox(height: 15);

  smallVerticalSpace() => SizedBox(height: 20);

  small30VerticalSpace() => SizedBox(height: 30);

  mediumVerticalSpace() => SizedBox(height: 40);

  tiny5HorizontalSpace() => SizedBox(width: 5);

  tinyHorizontalSpace() => SizedBox(width: 10);

  small30HorizontalSpace() => SizedBox(width: 30);

  tiny15HorizontalSpace() => SizedBox(width: 15);

  smallHorizontalSpace() => SizedBox(width: 20);

  mediumHorizontalSpace() => SizedBox(width: 40);

}

width(context) => Get.size.width;

height(context) => Get.size.height;
const BODY_PADDING = 20.0;
const VERTICAL_PADDING = 20.0;

verticalSpace(context, factor) => SizedBox(height: height(context) * factor);

horizontalSpace(context, factor) => SizedBox(width: width(context) * factor);

tiny5VerticalSpace() => SizedBox(height: 5);

tinyVerticalSpace() => SizedBox(height: 10);

tiny15VerticalSpace() => SizedBox(height: 15);

smallVerticalSpace() => SizedBox(height: 20);

small30VerticalSpace() => SizedBox(height: 30);

mediumVerticalSpace() => SizedBox(height: 40);

largeVerticalSpace() => SizedBox(height: 50);

tiny5HorizontalSpace() => SizedBox(width: 5);

tinyHorizontalSpace() => SizedBox(width: 10);

small30HorizontalSpace() => SizedBox(width: 30);

tiny15HorizontalSpace() => SizedBox(width: 15);

smallHorizontalSpace() => SizedBox(width: 20);

mediumHorizontalSpace() => SizedBox(width: 40);
