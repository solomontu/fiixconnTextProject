// ignore_for_file: prefer_const_constructors
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:uitest/routes/auth_routes.dart';
import 'package:uitest/uis/sreens/auth_home.dart';
import 'package:uitest/uis/sreens/home_screens/home.dart';

import '../app_constants/route_paths.dart';

class BaseRoute {
  BaseRoute();

  static final List<GetPage<dynamic>> baseRoutes = [
    GetPage(name: Routes.authHome, page: () => AuthHome()),
    ...AuthRoutes.authRoutes,
    GetPage(name: Routes.home, page: () => Home()),
  ];
}
