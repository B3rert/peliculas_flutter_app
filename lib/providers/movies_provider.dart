// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '4147f39bdd95a2f37dad4a95b5da1357';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('MoviesProvider');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final nowPlayingRespinse = NowPlayingResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingRespinse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      _baseUrl,
      '/3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '1',
      },
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [
      ...popularMovies,
      ...popularResponse.results,
    ];
    notifyListeners();
  }
}
