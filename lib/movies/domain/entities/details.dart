import 'package:equatable/equatable.dart';

import 'genres.dart';

class Details extends Equatable {
  final String ?backdropPath;
  final List<Genres> genres;
  final String overviwe;
  final String relaseDate;
  final int runtime;
  final double voteAverage;
  final int id;
  final String tittle;

  const Details(
      this.backdropPath,
      {
        required this.tittle,

      required this.genres,
      required this.overviwe,
      required this.relaseDate,
      required this.runtime,
      required this.voteAverage,
      required this.id});

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        overviwe,
        relaseDate,
        runtime,
        voteAverage,
        id,
      ];
}
