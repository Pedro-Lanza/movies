import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/controllers/details_controller.dart';
import 'package:movies/app/data/models/movie.dart';
import 'package:movies/app/pages/details/widgets/details_info.dart';
import 'package:movies/app/pages/details/widgets/details_topbar.dart';

class DetailsPage extends GetView<DetailsController> {
  DetailsPage({super.key});
  final Movie movie = Get.arguments as Movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('DetailsPage')),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopBar(movie: movie),
          DetailsInfo(movie: movie),
        ],
      ),
    );
  }
}
