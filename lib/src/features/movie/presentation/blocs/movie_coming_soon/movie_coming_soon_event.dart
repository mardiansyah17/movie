part of 'movie_coming_soon_bloc.dart';

sealed class MovieNowPlayingEvent extends Equatable {
  const MovieNowPlayingEvent();

  @override
  List<Object> get props => [];
}

final class LoadMoviesNowPlaying extends MovieNowPlayingEvent {}
