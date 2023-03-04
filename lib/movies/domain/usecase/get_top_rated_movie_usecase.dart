import 'package:dartz/dartz.dart';
import 'package:movies_app/core/baseusecase/base_use.dart';
import 'package:movies_app/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase extends BaseUseCase<List<Movies>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure ,List<Movies> >> call(NoParameters parameters)async{
    return await baseMovieRepository.getTopRateMovie();
  }
}