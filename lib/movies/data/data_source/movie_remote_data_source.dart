import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/api_constant.dart';
import 'package:movies_app/exception/server_exception.dart';
import 'package:movies_app/movies/data/models/details_movie_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../../error/exception.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovie();

  Future<List<MoviesModel>> getTopRatedMovie();

  Future<List<MoviesModel>> getPopularMovie();

  Future<MovieDetailModel> getMovieDetails(DetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovie() async {
    final response = await Dio().get(ApiConstant.nowPlayingMovieUrl);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          serverExceptionModel: ServerExceptionModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovie() async {
    final response = await Dio().get(ApiConstant.popularMovieUrl);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data["results"] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          serverExceptionModel: ServerExceptionModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovie() async {
    final response = await Dio().get(ApiConstant.topRatedMovieUrl);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerException(
          serverExceptionModel: ServerExceptionModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails(DetailsParameters parameters) async {
    final response = await Dio().get(ApiConstant.pathDetails(parameters.id));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          serverExceptionModel: ServerExceptionModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstant.pathRecommendation(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          serverExceptionModel: ServerExceptionModel.fromJson(response.data));
    }
  }
}
