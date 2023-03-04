part of 'details_movie_bloc.dart';

abstract class DetailsMovieEvent extends Equatable {
  const DetailsMovieEvent();
}
 // List<Object> get props => [];


class GetMovieDetailsEvent extends DetailsMovieEvent {
  final int id;

  const GetMovieDetailsEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class GetRecommendationMovieEvent extends DetailsMovieEvent{
  final int id;

  const GetRecommendationMovieEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
