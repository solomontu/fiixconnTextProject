import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uitest/config/app_theme_data.dart';
import 'package:uitest/routes/base_route.dart';

import 'app_constants/route_paths.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 730),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FIIXCONN',
        getPages: BaseRoute.baseRoutes,
        initialRoute: Routes.authHome,
        theme: AppThemeData.themeDataLight,
      ),
    );
  }
}
