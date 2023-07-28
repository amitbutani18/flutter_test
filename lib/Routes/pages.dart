import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:new_project_k/Routes/routes.dart';

import '../Modules/Home_module/home_screen.dart';
import '../Modules/splash_module/splash_screen.dart';

const Transition transition = Transition.native;

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: transition),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        transition: transition),
  ];
}
