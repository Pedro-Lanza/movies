import 'package:get/get.dart';

class DetailsController extends GetxController {
  // final MyRepository repository;
  // DetailsController(this.repository);

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
