import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movies/app/controllers/home_controller.dart';

class FilterText extends GetView<HomeController> {
  const FilterText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (String value) {
        controller.FilterText(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintText: "Pesquise filmes",
        fillColor: const Color.fromRGBO(241, 243, 245, 1),
      ),
    );
  }
}
