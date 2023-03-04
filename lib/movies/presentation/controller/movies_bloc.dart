import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/baseusecase/base_use.dart';
import 'package:movies_app/core/utils/enum.dart';

import 'package:movies_app/movies/domain/usecase/get_playing_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movie_usecase.dart';
import 'package:movies_app/movies/presentation/controller/event_movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/state_movie_bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetPlayingMovieUseCase getPlayingMovieUseCase;
  GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  GetPopularMovieUseCase getPopularMovieUseCase;

  MovieBloc(this.getPlayingMovieUseCase, this.getTopRatedMovieUseCase,
      this.getPopularMovieUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetTopRatedEvent>(_getTopRated);
  }

  FutureOr<void> _getNowPlaying(
      GetNowPlayingEvent event, Emitter<MovieState> emit) async {
    final result = await getPlayingMovieUseCase(const NoParameters());
    result.fold((l) {
      emit(state.copyWith(
          nowPlayingState: RequestState.error, nowPlayingMessage: l.message));
    }, (r) {
      return emit(
          state.copyWith(nowPlayingState: RequestState.loaded, nowPlaying: r));
    });
  }

  FutureOr<void> _getPopular(
      GetPopularEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMovieUseCase(const NoParameters());
    emit(result.fold((l) {
      return state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      );
    }, (r) {
      return state.copyWith(popular: r,popularState: RequestState.loaded);
    }));
  }

  FutureOr<void> _getTopRated(
      GetTopRatedEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameters());

    result.fold((l) {
      return emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      ));
    }, (r) {
      return emit(state.copyWith(topRated: r,topRatedState: RequestState.loaded));
    });
  }
}
