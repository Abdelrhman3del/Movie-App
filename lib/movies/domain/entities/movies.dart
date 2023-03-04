import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final List<int> genreIds;
  final int id;
  final String backdropPath;
  final String title;
  final double voteAverage;
  final String overview;
  final String releaseDate;

  const Movies({
    required this.genreIds,
    required this.releaseDate,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.overview,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        id,
        backdropPath,
        voteAverage,
        overview,
        genreIds,
    releaseDate,
      ];
}
