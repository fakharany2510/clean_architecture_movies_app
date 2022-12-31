import 'package:movies/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.id, required super.backdropPath});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          id: json['id'],
          backdropPath: json['backdrop_path'] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg');
}
