// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '4147f39bdd95a2f37dad4a95b5da1357';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> movieCast = {};

  int _popularPage = 0;

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': "$page",
      },
    );

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    return response.body;
  }

  MoviesProvider() {
    print('MoviesProvider');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    // Await the http get response, then decode the json-formatted response.
    final nowPlayingRespinse = NowPlayingResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingRespinse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('/3/movie/popular', _popularPage);

    // Await the http get response, then decode the json-formatted response.
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [
      ...popularMovies,
      ...popularResponse.results,
    ];
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('/3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    movieCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final urlSearch = Uri.https(
      _baseUrl,
      '/3/search/movie',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': "1",
        'query': query,
      },
    );

    var response = await http.get(urlSearch);

    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
