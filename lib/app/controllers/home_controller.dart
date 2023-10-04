import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/app/data/models/movie.dart';
import 'package:movies/app/data/repository/movie_repository.dart';
import 'package:movies/app/pages/home/widgets/filter_button.dart';
import 'package:movies/app/pages/home/widgets/movie_card.dart';

class HomeController extends GetxController {
  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  RxBool isLoading = false.obs;
  List<Movie> movies = <Movie>[];
  List<Movie> currentMovies = <Movie>[].obs;
  List<MovieCard> movieCards = <MovieCard>[].obs;
  List<String> genres = <String>[];
  List<String> currentGenres = <String>[];
  List<FilterButton> filterButtons = <FilterButton>[];
  List<bool> buttonStates = <bool>[].obs;

  final MovieRepository? movieRepository;
  HomeController({@required this.movieRepository})
      : assert(movieRepository != null);

  @override
  void onInit() {
    isLoading.value = true;
    fetchData();
    super.onInit();
  }

  void reloadData() {
    isLoading.value = true;
    fetchData();
  }

  List<String> findGenres(List<List<String>> categorias) {
    List<String> response = <String>[];
    for (List<String> lista in categorias) {
      for (String categoria in lista) {
        if (!response.contains(categoria)) {
          response.add(categoria);
        }
      }
    }
    return response;
  }

  void fetchData() {
    update();
    movieRepository?.getMovies().then((value) {
      movies = value;
      currentMovies = movies;
      genres = findGenres(movies.map((e) => e.categorias).toList());
      currentGenres = genres;
      FillMovieInfo();
      FillGenresInfo();
      currentGenres.clear();
      isLoading.value = false;
      update();
    });
  }

  void FillGenresInfo() {
    filterButtons.clear();
    buttonStates.clear();
    int i = 0;
    for (String genre in currentGenres) {
      buttonStates.add(false);
      filterButtons.add(FilterButton(
        genre: genre,
        indx: i++,
      ));
    }
  }

  void FillMovieInfo() {
    movieCards.clear();
    for (Movie movie in currentMovies) {
      movieCards.add(
        MovieCard(
          imagePath: movie.image,
          title: movie.titulo,
          categorias: movie.categorias,
          movie: movie,
        ),
      );
    }
  }

  void resetButtons() {
    for (int i = 0; i < buttonStates.length; i++) {
      buttonStates[i] = false;
    }
  }

  void FilterGenre(String genre, int index) {
    buttonStates[index] = true;
    currentGenres.add(genre);
    currentMovies = movies
        .where((element) => element.categorias
            .toSet()
            .intersection(currentGenres.toSet())
            .isNotEmpty)
        .toList();
    FillMovieInfo();
    update();
  }

  void DefilterGenre(String genre, int index) {
    buttonStates[index] = false;
    currentGenres.remove(genre);
    if (currentGenres.isEmpty) {
      currentMovies = movies;
    } else {
      currentMovies = movies
          .where((element) => element.categorias
              .toSet()
              .intersection(currentGenres.toSet())
              .isNotEmpty)
          .toList();
    }
    FillMovieInfo();
    update();
  }

  void FilterText(String search) {
    print(search);
    if (search.isEmpty) {
      currentMovies = movies;
    } else {
      currentMovies = movies
          .where((element) =>
              element.titulo.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    resetButtons();
    FillMovieInfo();
    update();
  }
}
