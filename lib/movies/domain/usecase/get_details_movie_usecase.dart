
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/baseusecase/base_use.dart';
import 'package:movies_app/error/failure.dart';
import 'package:movies_app/movies/domain/entities/details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetDetailsMovieUseCase extends BaseUseCase <Details, DetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetDetailsMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, Details>> call(
      DetailsParameters parameters) async {
    return await baseMovieRepository.getDetails(  parameters);
  }
}

class DetailsParameters extends Equatable {
  final int id;

  const DetailsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
