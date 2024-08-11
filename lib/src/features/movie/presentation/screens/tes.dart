import 'package:dio/dio.dart';
import 'package:movie/src/core/constant/constant.dart';
import 'package:movie/src/core/errors/exceptions.dart';
import 'package:movie/src/features/movie/data/models/movie_model.dart';

abstract interface class MovieRemoteDatasource {
  Future<MovieModel> findMovieById(int id);
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final Dio dio;

  MovieRemoteDatasourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}/movie/now_playing',
        queryParameters: {"region": "ID"},
        options: Options(
          headers: {
            "accept": 'application/json',
            "Authorization":
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODFiYzFmYzgwNGUxMzg0YjMzYjM4MmU0MWMxMjFlNyIsIm5iZiI6MTcxOTIxMTg0MC45NDk1NTQsInN1YiI6IjY2NzI4NzU2NGEwOThlN2Y1YzU1OWVmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zyqekStrk5oRBqKY5nzi4BJZDzXI_7YUua74TkhurvI'
          },
        ),
      );

      final List<dynamic> results = response.data['results'];
      final List<MovieModel> movies = results
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(e.response?.statusMessage ?? "Ada kesalahan",
            e.response?.statusCode);
      } else {
        throw ServerException(e.response?.statusMessage ?? "Ada kesalahan",
            e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }

  @override
  Future<MovieModel> findMovieById(int id) {
    // TODO: implement findMovieById
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}/movie/upcoming',
        queryParameters: {"region": "ID"},
        options: Options(
          headers: {
            "accept": 'application/json',
            "Authorization":
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ODFiYzFmYzgwNGUxMzg0YjMzYjM4MmU0MWMxMjFlNyIsIm5iZiI6MTcxOTIxMTg0MC45NDk1NTQsInN1YiI6IjY2NzI4NzU2NGEwOThlN2Y1YzU1OWVmMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zyqekStrk5oRBqKY5nzi4BJZDzXI_7YUua74TkhurvI'
          },
        ),
      );
      final List<dynamic> results = response.data['results'];

      final List<MovieModel> movies = results
          .map<MovieModel>((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        throw CancelTokenException(
            e.response?.statusMessage ?? "Ada kesalahan coming soon",
            e.response?.statusCode);
      } else {
        throw ServerException(
            e.response?.statusMessage ?? "Ada kesalahan coming soon",
            e.response?.statusCode);
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString(), null);
    }
  }
}
