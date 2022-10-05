import 'dart:convert';

import 'package:cleanapp/core/error/exceptions.dart';
import 'package:cleanapp/movies/data/models/movie_details_model.dart';
import 'package:cleanapp/movies/data/models/movie_model.dart';
import 'package:cleanapp/movies/data/models/recommendation_model.dart';
import 'package:cleanapp/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:dio/dio.dart';

import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=c1f3631998bff8601995649df39daaf2');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=c1f3631998bff8601995649df39daaf2&language=en-US');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=c1f3631998bff8601995649df39daaf2&language=en-US&page=1');
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/${parameters.movieId}?api_key=c1f3631998bff8601995649df39daaf2&language=en-US');
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/${parameters.id}/recommendations?api_key=c1f3631998bff8601995649df39daaf2&language=en-US');
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
