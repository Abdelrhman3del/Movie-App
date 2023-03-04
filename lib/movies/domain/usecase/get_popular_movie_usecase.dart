import 'package:dartz/dartz.dart';
import 'package:movies_app/core/baseusecase/base_use.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../error/failure.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<Movies>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);
@override
  Future<Either<Failure ,List<Movies> >> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovie();
  }
}
