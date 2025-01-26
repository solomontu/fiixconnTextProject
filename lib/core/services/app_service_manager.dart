import 'package:uitest/config/dimensions.dart';
import 'package:uitest/core/services/color_service.dart';
import 'package:uitest/core/services/routing_service.dart';

class AppServiceManager {
  late ColorService colorService;
  late RouterService routerService;
  late DimensionService dimension;

  AppServiceManager() {
    colorService = ColorService();
    routerService = RouterService();
    dimension = DimensionService();
  }
}

AppServiceManager as = AppServiceManager();
