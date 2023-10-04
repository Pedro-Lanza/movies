import 'package:get/get.dart';
import 'package:movies/app/controllers/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
