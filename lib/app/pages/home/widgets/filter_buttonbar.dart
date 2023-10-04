import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/controllers/home_controller.dart';

class FilerButtonBar extends GetView<HomeController> {
  const FilerButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // child: ToggleButtons(
      //   renderBorder: false,
      //   isSelected: List<bool>.filled(controller.filterButtons.length, false),
      //   children: controller.filterButtons,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.filterButtons,
      ),
    );
  }
}
