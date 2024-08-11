import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movie/src/core/network/bloc/network_bloc.dart';
import 'package:movie/src/core/network/network_info.dart';
import 'package:movie/src/features/movie/data/datasources/remote/movie_remote_datasource.dart';
import 'package:movie/src/features/movie/data/repositories/mvoie_repository_impl.dart';
import 'package:movie/src/features/movie/domain/repositories/movie_repository.dart';
import 'package:movie/src/features/movie/domain/usecases/find_movie_by_id.dart';
import 'package:movie/src/features/movie/domain/usecases/get_movie_now_playing.dart';
import 'package:movie/src/features/movie/domain/usecases/get_movie_upcoming.dart';
import 'package:movie/src/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/src/features/movie/presentation/blocs/movie_now_playing/movie_now_playing_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  // Inisialisasi Dio terlebih dahulu
  serviceLocator.registerLazySingleton(() => Dio());
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnection()));

  serviceLocator
      .registerFactory(() => NetworkBloc(networkInfo: serviceLocator()));
  // Panggil initMovie setelah inisialisasi Dio
  initMovie();
}

void initMovie() {
  // datasource
  serviceLocator
    ..registerFactory<MovieRemoteDatasource>(
      () => MovieRemoteDatasourceImpl(
        serviceLocator(), // Menggunakan Dio dari service locator
      ),
    )
    // repository
    ..registerFactory<MovieRepository>(
      () => MvoieRepositoryImpl(
        serviceLocator(),
      ),
    )
    // usecase
    ..registerFactory(
      () => FindMovieById(
        movieRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetMovieNowPlaying(
        movieRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetMovieUpcoming(
        movieRepository: serviceLocator(),
      ),
    )
    // bloc
    ..registerLazySingleton(() => MovieBloc(
        findMovieById: serviceLocator(),
        getMovieNowPlaying: serviceLocator(),
        getMovieComingSoon: serviceLocator()))
    ..registerLazySingleton(() => MovieNowPlayingBloc(
          getMovieNowPlaying: serviceLocator(),
        ));
}
