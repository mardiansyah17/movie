import 'package:dartz/dartz.dart';
import 'package:movie/src/core/errors/failures.dart';
import 'package:movie/src/core/usecase/usecase.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/repositories/movie_repository.dart';

class FindMovieById implements UseCase<Movie, ParamsFindMovieById> {
  final MovieRepository movieRepository;

  FindMovieById({required this.movieRepository});
  @override
  Future<Either<Failure, Movie>> call(ParamsFindMovieById params) async {
    return await movieRepository.findMovieById(params.id);
  }
}

class ParamsFindMovieById {
  final int id;

  ParamsFindMovieById({required this.id});
}
