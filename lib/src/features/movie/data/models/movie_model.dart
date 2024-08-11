import 'package:movie/src/features/movie/data/models/movie_detail_model.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/entities/movie_detail.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.posterPath,
    super.movieDetail,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      "title": title,
      "posterPath": posterPath
    };
  }

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
        id: map['id'] ?? "",
        title: map['original_title'] ?? "",
        posterPath: map['poster_path'] ?? "",
        movieDetail: map['movieDetail']);
  }
}
