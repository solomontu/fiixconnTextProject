import 'package:flutter/material.dart';
import 'package:uitest/data/models/appbar_text_items_model.dart';
import 'package:uitest/data/models/reaction_button_model.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/feeds/feeds.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/feeds/feeds_screens/following.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/feeds/feeds_screens/for_you.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/feeds/feeds_screens/live.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/messages.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/mini_app.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/notifications.dart';
import 'package:uitest/uis/sreens/home_screens/bottomsheet_screens/profile.dart';

import 'app_assets.dart';

class Constants {
  static const List<String> language = <String>['English', 'French'];
  static const List<String> shops = <String>[
    'Shop . 1',
    'Shop . 2',
    'Shop . 3',
    'Shop . 4'
  ];

  static const String emailRegex = '[a-zA-Z0-9\+\.\_\%\-\+]{1,256}' +
      '\\@' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}' +
      '(' +
      '\\.' +
      '[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}' +
      ')+';

  static const String phoneNumberRegex = r'0[789][01]\d{8}';
  static const String upperCaseRegex = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
  static const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
  static const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
  static const String digitRegex = r'^(?=.*?[0-9]).{8,}$';

  static const List<Widget> homeWidgetOptions = <Widget>[
    MiniApp(),
    Messages(),
    Feeds(),
    Notifications(),
    Profile()
  ];
  static List<AppbarTextItemsModelModel> appBarWidgetOptions = [
    AppbarTextItemsModelModel(
      name: 'Live',
      isClicked: false,
    ),
    AppbarTextItemsModelModel(
      name: 'Following',
      isClicked: false,
    ),
    AppbarTextItemsModelModel(
      name: 'For you',
      isClicked: true,
    ),
  ];

  static const appbarScreenOptions = [Live(), Following(), ForYou()];
  static List<ReactionButtonModel> reactionItems = [
    ReactionButtonModel(iconName: Assets.heart, count: '1.2k'),
    ReactionButtonModel(iconName: Assets.messages, count: '17'),
    ReactionButtonModel(iconName: Assets.archiveTick, count: '12'),
    ReactionButtonModel(iconName: Assets.forwardOutline, count: '24')
  ];
}
