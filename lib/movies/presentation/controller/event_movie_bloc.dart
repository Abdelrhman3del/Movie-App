import 'package:equatable/equatable.dart';

 abstract class MovieEvent extends Equatable{

  const MovieEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GetNowPlayingEvent extends MovieEvent{}
class GetTopRatedEvent extends MovieEvent{}
class GetPopularEvent extends MovieEvent{}