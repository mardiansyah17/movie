import 'package:dartz/dartz.dart';
import 'package:movie/src/core/errors/failures.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, Movie>> findMovieById(int id);
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getComingSoon();
}
