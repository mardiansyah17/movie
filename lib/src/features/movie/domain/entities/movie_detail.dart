class MovieDetail {
  final String language;
  final List<String> genres;
  final String age;
  final int duration;

  final String synopsis;
  // final List<dynamic> casts;
  MovieDetail({
    required this.language,
    required this.genres,
    required this.age,
    required this.duration,
    required this.synopsis,
    // required this.casts,
  });
}

class Cast {
  final String originalName;
  final String? job;
  final String posterPath;

  Cast({
    required this.originalName,
    required this.job,
    required this.posterPath,
  });
}
