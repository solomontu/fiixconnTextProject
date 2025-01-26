import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:uitest/app_constants/route_paths.dart';
import 'package:uitest/uis/sreens/login.dart';
import 'package:uitest/uis/sreens/signup.dart';

class AuthRoutes {
  AuthRoutes();

  static final List<GetPage<dynamic>> authRoutes = [
    GetPage(name: Routes.login, page: () => Login()),
    GetPage(name: Routes.signup, page: () => Signup()),
  ];
}
