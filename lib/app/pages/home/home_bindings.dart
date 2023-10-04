import 'package:get/get.dart';
import 'package:movies/app/controllers/home_controller.dart';
import 'package:movies/app/data/providers/movie_api.dart';
import 'package:movies/app/data/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(
        movieRepository:
            MovieRepository(apiClient: Api(httpClient: http.Client()))));
  }
}
