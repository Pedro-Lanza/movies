//fazer a requisição dos filmes mais populares, e para cada filme requisitar os detalhes e creditos e assim formar um objeto completo

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/app/data/constants.dart';
import 'package:movies/app/data/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  final http.Client? httpClient;
  Api({@required this.httpClient});

  static const _url =
      'https://api.themoviedb.org/3/movie/popular?language=pt-BR&api_key=${Constants.apiKey}';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;

      List<Movie> detailedMovies = <Movie>[];
      for (dynamic movie in decodedData) {
        final detailsCall = await http.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${movie['id']}?language=pt-BR&api_key=${Constants.apiKey}'));
        final castCall = await http.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${movie['id']}/credits?language=pt-BR&api_key=${Constants.apiKey}'));

        final decodedDetails = json.decode(detailsCall.body);
        final decodedCast = json.decode(castCall.body);

        Movie detailedMovie = Movie.fromJson(decodedDetails, decodedCast);

        detailedMovies.add(detailedMovie);
      }

      return detailedMovies;
    } else {
      throw Exception("unable to get movies throw API");
    }
  }
}
