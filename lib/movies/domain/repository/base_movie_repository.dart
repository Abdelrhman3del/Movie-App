import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../../error/failure.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure ,List<Movies> >> getPlayingMovie();
  Future<Either<Failure ,List<Movies> >>getTopRateMovie();
  Future<Either<Failure ,List<Movies> >> getPopularMovie();
  Future<Either<Failure ,Details >> getDetails(DetailsParameters parameters);
  Future<Either<Failure ,List<Recommendation> >> getRecommendation(RecommendationParameters parameters);
}