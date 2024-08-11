import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie/src/core/usecase/usecase.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/usecases/find_movie_by_id.dart';
import 'package:movie/src/features/movie/domain/usecases/get_movie_now_playing.dart';
import 'package:movie/src/features/movie/domain/usecases/get_movie_upcoming.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final FindMovieById _findMovieById;
  final GetMovieNowPlaying _getMovieNowPlaying;
  final GetMovieUpcoming _getMovieUpcoming;
  MovieBloc({
    required FindMovieById findMovieById,
    required GetMovieNowPlaying getMovieNowPlaying,
    required GetMovieUpcoming getMovieComingSoon,
  })  : _findMovieById = findMovieById,
        _getMovieNowPlaying = getMovieNowPlaying,
        _getMovieUpcoming = getMovieComingSoon,
        super(MovieInitial()) {
    on<MovieEvent>((event, emit) => emit(MovieLoading()));

    on<LoadMovies>(
      (event, emit) async {
        log('mantap');
        try {
          final movieNowPlaying = await _getMovieNowPlaying(NoParams());
          final movieComingSoon = await _getMovieUpcoming(NoParams());
          movieNowPlaying.fold((l) => emit(MovieFailure(l.errorMessage)),
              (nowPlaying) {
            movieComingSoon.fold((l) => emit(MovieFailure(l.errorMessage)),
                (comingSoon) {
              emit(MoviePageLoaded(
                  nowPlaying: nowPlaying, comingSoon: comingSoon));
            });
          });
        } catch (e) {
          log('gagal');
        }
      },
    );

    on<FindMovie>((event, emit) async {
      final movieById = await _findMovieById(ParamsFindMovieById(id: event.id));
      movieById.fold((l) {
        print(l.errorMessage);
        emit(MovieFailure(l.errorMessage));
      }, (r) {
        emit(MovieDetailLoaded(r));
      });
    });
  }
}
