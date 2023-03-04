import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel(
      {required super.genreIds,
      required super.releaseDate,
      required super.id,
      required super.backdropPath,
      required super.title,
      required super.voteAverage,
      required super.overview});

  factory MoviesModel.fromJson(Map<String, dynamic> json)=> MoviesModel(
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        releaseDate: json['backdrop_path'],
        id: json['id'],
        backdropPath: json['backdrop_path'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        overview: json['overview'],
      );
}
