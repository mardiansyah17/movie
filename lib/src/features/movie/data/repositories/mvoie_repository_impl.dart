import 'package:dartz/dartz.dart';
import 'package:movie/src/core/errors/exceptions.dart';
import 'package:movie/src/core/errors/failures.dart';
import 'package:movie/src/features/movie/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie/src/features/movie/data/models/movie_model.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/repositories/movie_repository.dart';

class MvoieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource movieRemoteDatasource;

  MvoieRepositoryImpl(this.movieRemoteDatasource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final getMovies = await movieRemoteDatasource.getNowPlaying();

      return right(getMovies);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getComingSoon() async {
    try {
      final getMovies = await movieRemoteDatasource.getComingSoon();
      return right(getMovies);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return left(CancelTokenFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, Movie>> findMovieById(int id) async {
    try {
      final getMovieById = await movieRemoteDatasource.findMovieById(id);
      return right(getMovieById);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
