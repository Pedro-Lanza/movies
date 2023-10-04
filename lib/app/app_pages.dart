import 'package:get/get.dart';
import 'package:movies/app/pages/details/details_binding.dart';
import 'package:movies/app/pages/details/details_page.dart';
import 'package:movies/app/pages/home/home_bindings.dart';
import 'package:movies/app/pages/home/home_page.dart';
import 'package:movies/app/pages/splash/splash_binding.dart';
import 'package:movies/app/pages/splash/splash_page.dart';
part "app_routes.dart";

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => DetailsPage(),
      binding: DetailsBinding(),
    ),
  ];
}
