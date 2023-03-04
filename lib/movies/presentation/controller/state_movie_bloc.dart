import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enum.dart';

import '../../domain/entities/movies.dart';

class MovieState extends Equatable {
  final List<Movies> nowPlaying;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popular;
  final RequestState popularState;
  final String popularMessage;
  final List<Movies> topRated;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState(
      {this.topRated = const [],
      this.topRatedState = RequestState.loading,
      this.topRatedMessage = '',
      this.popularMessage = '',
      this.popularState = RequestState.loading,
      this.popular = const [],
      this.nowPlaying = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = ''});

  MovieState copyWith({
    final List<Movies>? nowPlaying,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? popular,
    RequestState? popularState,
    String? popularMessage,
    final List<Movies>? topRated,
    RequestState? topRatedState,
    String? topRaedMessage,
  }) {
    return MovieState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popular: popular ?? this.popular,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRated: topRated ?? this.topRated,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        nowPlayingState,
        nowPlayingMessage,
        nowPlaying,
        popularState,
        popular,
        popularMessage,
        topRated,
        topRatedMessage,
        topRatedMessage
      ];
}
