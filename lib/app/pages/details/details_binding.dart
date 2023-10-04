import 'package:get/get.dart';
import 'package:movies/app/controllers/details_controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailsController());
  }
}
