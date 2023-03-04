import 'package:movies_app/movies/data/models/genres_movie_model.dart';
import 'package:movies_app/movies/domain/entities/details.dart';

class MovieDetailModel extends Details {
  const MovieDetailModel(
      super.backdropPath,
      {
    required super.genres,
    required super.overviwe,
    required super.relaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.id, required super.tittle});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json)=>
      MovieDetailModel(
        tittle: json['title'],
          json ['backdrop_path'] ,
          genres: List.from(json['genres'].map((x)=>GenresMovieModel.fromJson(x))),
          overviwe:json ['overview'],
          relaseDate:json ['release_date'],
          runtime:json ['runtime'],
          voteAverage:json ["vote_average"].toDouble(),
          id: json['id']);


}
