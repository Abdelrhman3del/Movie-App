import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(super.backdropPath,{  required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(json ['backdrop_path']??'/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg', id: json['id']);
}
