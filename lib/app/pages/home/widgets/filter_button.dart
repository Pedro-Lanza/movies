import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/controllers/home_controller.dart';

class FilterButton extends GetView<HomeController> {
  final String genre;
  final int indx;
  const FilterButton({super.key, required this.genre, required this.indx});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: TextButton(
            style: controller.buttonStates[indx]
                ? TextButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 56, 76, 1),
                    foregroundColor: Colors.white,
                    side: const BorderSide(
                        color: Color.fromRGBO(241, 243, 245, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  )
                : TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color.fromRGBO(0, 56, 76, 1),
                    side: const BorderSide(
                        color: Color.fromRGBO(241, 243, 245, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
            onPressed: () {
              controller.buttonStates[indx]
                  ? controller.DefilterGenre(genre, indx)
                  : controller.FilterGenre(genre, indx);
            },
            child: Text(
              genre,
              // style: TextStyle(color: Color.fromRGBO(0, 56, 76, 1)),
            ),
          ),
        ));
  }
}
