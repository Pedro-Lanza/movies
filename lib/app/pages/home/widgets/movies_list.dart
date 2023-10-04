import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movies/app/controllers/home_controller.dart';

class MoviesList extends GetView<HomeController> {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    // return controller.isLoading.value
    //     ? const CircularProgressIndicator()
    //     : ListView.builder(
    //         shrinkWrap: true,
    //         physics: const ClampingScrollPhysics(),
    //         itemBuilder: (context, index) => MovieCard(
    //             imagePath: controller.currentMovies[index].image,
    //             title: controller.currentMovies[index].titulo,
    //             categorias: controller.currentMovies[index].categorias,
    //             movie: controller.currentMovies[index]),
    //       );
    return Column(
      children: controller.movieCards,
      // controller.isLoading.value
      //     ? <Widget>[const CircularProgressIndicator()]
      //     :
    ); //);
  }
}
