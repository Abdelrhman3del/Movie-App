import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/usecase/get_details_movie_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies_app/movies/presentation/controller/details_movie_state.dart';

part 'details_movie_event.dart';

class DetailsMovieBloc extends Bloc<DetailsMovieEvent, MovieDetailsState> {
  DetailsMovieBloc(this.getDetailsMovieUseCase, this.recommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getDetails);
    on<GetRecommendationMovieEvent>(_getRecommendation);
  }

 final GetRecommendationUseCase recommendationUseCase;
 final GetDetailsMovieUseCase getDetailsMovieUseCase;

  FutureOr<void> _getDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getDetailsMovieUseCase(DetailsParameters(id: event.id));
    print('get details $result');
    return result.fold(
        (l) =>  emit(
              state.copyWith(
                  messageDetails: l.message,
                  detailsRequestState: RequestState.error),
            ),
        (r) => emit(
              state.copyWith(
                  details: r, detailsRequestState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getRecommendation(
      GetRecommendationMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result =

    await recommendationUseCase(RecommendationParameters(event.id));
  //  print('get recommendation $result');
    return  result.fold(
        (l) => emit(state.copyWith(
            requestStateRecommendation: RequestState.error,
            messageRecommendation: l.message)),
        (r) => emit(state.copyWith(
            recommendation: r,
            requestStateRecommendation: RequestState.loaded)));
  }
}
