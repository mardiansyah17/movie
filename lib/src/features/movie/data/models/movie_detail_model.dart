import 'package:movie/src/features/movie/domain/entities/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel({
    required super.age,
    required super.duration,
    required super.synopsis,
    // required super.casts,
    required super.language,
    required super.genres,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'age': age,
      "duration": duration,
      "synopsis": synopsis,
      // "casts": casts,
      "language": language,
      "genres": genres
    };
  }

  factory MovieDetailModel.fromJson(Map<String, dynamic> map) {
    return MovieDetailModel(
      age: map['age'] ?? "",
      duration: map['duration'] ?? 0,
      synopsis: map['synopsis'] ?? "",
      // casts: map['casts'] ?? [],
      genres: map['genres'] ?? [],
      language: map['language'] ?? "",
    );
  }
}
