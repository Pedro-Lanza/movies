import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/app_pages.dart';
import 'package:movies/app/data/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String imagePath;
  final String title;
  final List<String> categorias;
  const MovieCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.categorias,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        onPressed: () => {Get.toNamed(Routes.details, arguments: movie)},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.black],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                child: Image.network(
                  imagePath, //"https://pbs.twimg.com/media/F7DL3HaXMAATx9L?format=jpg&name=large",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 30,
              left: 30,
              right: 0,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title, //"SimzArt",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      categorias.join(" - "), //"artista - cartunista",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w100),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
