import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/app_pages.dart';
import 'package:movies/app/data/models/movie.dart';

class TopBar extends StatelessWidget {
  final Movie movie;

  const TopBar({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
          height: 250.0,
          color: const Color.fromRGBO(245, 245, 245, 1),
        ),
        Container(
          padding: const EdgeInsets.only(top: 100.0),
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 10), // Shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                movie
                    .image, //"https://pbs.twimg.com/media/F7DL3HaXMAATx9L?format=jpg&name=large",
                // fit: BoxFit.cover,
                width: 300.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromRGBO(109, 112, 112, 1),
                  side:
                      const BorderSide(color: Color.fromRGBO(241, 243, 245, 1)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                onPressed: () => {Get.toNamed(Routes.home)},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.chevron_left_sharp), Text("Voltar")],
                  ),
                )),
          ),
        ),
      ]),
    );
  }
}
