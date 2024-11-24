import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies/api/model/MovieDetailsResponse.dart';
import 'model/Responses/MoviesResponse.dart';

class EndPoints {
  static const String popular = '3/movie/popular';
  static const String upComing = '3/movie/upcoming';
  static const String topRated = '3/movie/top_rated';
  static const String movieDetails = '3/movie';
  static const String search = '3/search/movie';
  static const String genres = '3/genre/movie/list';
  static const String genreMovies = '3/discover/movie';
}

class ApiManager {
  static const BASE_URL = 'api.themoviedb.org';
  static const API_KEY = '1ac47e864e00529dff10e5e851eb597c';
  static const posterPath = 'https://image.tmdb.org/t/p/w500';

  static Future<MoviesResponse?> getPopularMovies() async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, EndPoints.popular, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var popMoviesResponse = MoviesResponse.fromJson(json);
      return popMoviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}

    return null;
  }

  static Future<MoviesResponse?> getUpComingMovies() async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, EndPoints.upComing, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}

    return null;
  }

  static Future<MoviesResponse?> getTopRatedMovies() async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, EndPoints.topRated, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}

    return null;
  }

  static Future<MovieDetailsResponse?> getMovieDetails(
      {required num movieId}) async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, '${EndPoints.movieDetails}/$movieId', params);
    print('$url');
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var movieDetailsResponse = MovieDetailsResponse.fromJson(json);
      return movieDetailsResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}
    return null;
  }

  static Future<MoviesResponse?> getSimilarMovies(
      {required num movieId}) async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, '3/movie/$movieId/similar', params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}
    return null;
  }

  static Future<MoviesResponse?> searchForMovie(String? movieName) async {
    var params = {
      'api_key': API_KEY,
      'query': movieName,
    };
    var url = Uri.http(BASE_URL, EndPoints.search, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var moviesResponse = MoviesResponse.fromJson(json);

      return moviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}
    return null;
  }

  static Future<MovieDetailsResponse?> getGenres() async {
    var params = {
      'api_key': API_KEY,
    };
    var url = Uri.http(BASE_URL, EndPoints.genres, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var genresResponse = MovieDetailsResponse.fromJson(json);
      return genresResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}
    return null;
  }

  static Future<MoviesResponse?> getGenreMovies(
      {required String genreId}) async {
    var params = {
      'api_key': API_KEY,
      'with_genres': genreId,
    };
    var url = Uri.http(BASE_URL, EndPoints.genreMovies, params);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var moviesResponse = MoviesResponse.fromJson(json);
      return moviesResponse;
    } on SocketException {
    } on HttpException {
    } on FormatException {}
    return null;
  }
}
