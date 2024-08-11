part of 'movie_bloc.dart';

@immutable
sealed class MovieState extends Equatable {
  const MovieState();

  @override
  // TODO: implement hashCode
  List<Object> get props => [];
}

final class MovieInitial extends MovieState {}

final class MovieFailure extends MovieState {
  final String error;
  const MovieFailure(this.error);
}

final class MoviePageLoaded extends MovieState {
  final List<Movie> nowPlaying;
  final List<Movie> comingSoon;

  const MoviePageLoaded({required this.nowPlaying, required this.comingSoon});
}

final class MovieDetailLoaded extends MovieState {
  final Movie movie;

  const MovieDetailLoaded(this.movie);
}

final class MovieLoading extends MovieState {}
