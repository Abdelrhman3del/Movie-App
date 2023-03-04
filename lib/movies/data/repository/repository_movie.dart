import 'package:dartz/dartz.dart';
import 'package:movies_app/error/failure.dart';
import 'package:movies_app/exception/server_exception.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';

class RepositoryMovie extends BaseMovieRepository{
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  RepositoryMovie(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure ,List<Movies> >> getPlayingMovie()async {
    final result= await baseMovieRemoteDataSource.getNowPlayingMovie();
    try{
     return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.serverExceptionModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovie()async {
  final result= await baseMovieRemoteDataSource.getPopularMovie();
  try{
    return Right(result);
  }on ServerException catch(failure){
    return Left(ServerFailure(failure.serverExceptionModel.statusMessage));
  }

  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRateMovie()async {
    final result=await baseMovieRemoteDataSource.getTopRatedMovie();
    try{
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(failure.serverExceptionModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,Details>> getDetails(DetailsParameters parameters) async{
    final result= await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.serverExceptionModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{

    final result=await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
    return  Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.serverExceptionModel.statusMessage));
    }
  }
}


