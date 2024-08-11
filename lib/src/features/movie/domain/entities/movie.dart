import 'package:movie/src/features/movie/domain/entities/movie_detail.dart';

class Movie {
  final int id;
  final String title;
  final String posterPath;
  final MovieDetail? movieDetail;
  Movie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.movieDetail});
}
