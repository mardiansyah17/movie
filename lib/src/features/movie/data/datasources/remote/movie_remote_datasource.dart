import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  final String apiKey = dotenv.env['TMDB_API_KEY'] ?? "";
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}/movie/now_playing',
        queryParameters: {"region": "ID"},
        options: Options(
          headers: {"accept": 'application/json', "Authorization": apiKey},
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
  Future<MovieModel> findMovieById(int id) async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}/movie/$id',
        options: Options(
          headers: {"accept": 'application/json', "Authorization": apiKey},
        ),
        queryParameters: {
          "append_to_response": "videos,credits,release_dates",
          "language": "id-ID"
        },
      );
      return MovieModel.fromJson(response.data);
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
  Future<List<MovieModel>> getComingSoon() async {
    try {
      final response = await dio.get(
        '${Constant.baseUrl}/movie/upcoming',
        queryParameters: {"region": "ID"},
        options: Options(
          headers: {"accept": 'application/json', "Authorization": apiKey},
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
