import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/repository_movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_playing_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/details_movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() =>DetailsMovieBloc(sl(),sl()) );
    //useCase
    sl.registerLazySingleton(() => GetDetailsMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetPlayingMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => RepositoryMovie(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
