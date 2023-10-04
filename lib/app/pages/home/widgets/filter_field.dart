import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:movies/app/controllers/home_controller.dart';
import 'package:movies/app/pages/home/widgets/filter_buttonbar.dart';
import 'package:movies/app/pages/home/widgets/filter_text.dart';

class FilterField extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          FilterText(),
          const SizedBox(height: 10.0),
          FilerButtonBar(),
        ],
      ),
    );
  }
}
