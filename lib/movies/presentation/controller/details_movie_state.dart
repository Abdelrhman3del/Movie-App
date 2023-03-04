import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final Details? details;
  final RequestState detailsRequestState;
  final String messageDetails;
  final List<Recommendation>recommendation;
  final RequestState requestStateRecommendation;
  final String messageRecommendation;

  const MovieDetailsState({
    this.recommendation = const[],
    this.requestStateRecommendation = RequestState.loading,
    this.messageRecommendation = '',

    this.details,
    this.detailsRequestState = RequestState.loading,
    this.messageDetails = '',
  });

  MovieDetailsState copyWith({
    List<Recommendation> ?recommendation,
    RequestState? requestStateRecommendation,
    String ?messageRecommendation,
    Details? details,
    RequestState? detailsRequestState,
    String ?messageDetails,
  }) =>
      MovieDetailsState(
        recommendation: recommendation ?? this.recommendation,
        requestStateRecommendation: requestStateRecommendation ??
            this.requestStateRecommendation,
        messageRecommendation: messageRecommendation ??
            this.messageRecommendation,
        details: details ?? this.details,
        detailsRequestState: detailsRequestState ?? this.detailsRequestState,
        messageDetails: messageDetails ?? this.messageDetails,
      );

  @override
  List<Object?> get props =>
      [
        details,
        detailsRequestState,
        messageDetails,
        recommendation,
        requestStateRecommendation,
        messageRecommendation,
      ];
}
