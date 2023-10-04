import 'package:flutter/material.dart';
import 'package:movies/app/data/providers/movie_api.dart';

class MovieRepository {
  final Api? apiClient;
  MovieRepository({@required this.apiClient}) : assert(apiClient != null);

  Future getMovies() {
    return apiClient!.getMovies();
  }
}
