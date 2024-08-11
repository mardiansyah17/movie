import 'package:dartz/dartz.dart';
import 'package:movie/src/core/errors/failures.dart';
import 'package:movie/src/core/usecase/usecase.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/repositories/movie_repository.dart';

class GetMovieUpcoming implements UseCase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;

  GetMovieUpcoming({required this.movieRepository});
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return movieRepository.getComingSoon();
  }
}
