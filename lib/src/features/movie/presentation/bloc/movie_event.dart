part of 'movie_bloc.dart';

sealed class MovieEvent {}

final class FindMovie extends MovieEvent {
  final int id;

  FindMovie({required this.id});
}

final class MovieNowPlayingEvent extends MovieEvent {}

final class MovieComingSoonEvent extends MovieEvent {}

final class LoadMovies extends MovieEvent {}
