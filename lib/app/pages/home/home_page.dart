import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/controllers/home_controller.dart';
import 'package:movies/app/pages/home/widgets/filter_field.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Filmes'),
          actions: [
            IconButton(
                onPressed: controller.reloadData,
                icon: const Icon(Icons.refresh))
          ],
          backgroundColor: Colors.white,
          foregroundColor: const Color.fromRGBO(52, 58, 64, 1),
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            FilterField(),
            controller.isLoading.value
                ? const Column(children: [CircularProgressIndicator()])
                : Column(children: controller.movieCards),
          ],
        ),
      );
    });
  }
}
