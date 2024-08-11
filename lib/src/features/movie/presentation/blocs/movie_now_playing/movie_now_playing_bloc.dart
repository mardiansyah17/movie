import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/src/core/usecase/usecase.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/domain/usecases/get_movie_now_playing.dart';

part 'movie_now_playing_event.dart';
part 'movie_now_playing_state.dart';

class MovieNowPlayingBloc
    extends Bloc<MovieNowPlayingEvent, MovieNowPlayingState> {
  final GetMovieNowPlaying _getMovieNowPlaying;
  MovieNowPlayingBloc({
    required GetMovieNowPlaying getMovieNowPlaying,
  })  : _getMovieNowPlaying = getMovieNowPlaying,
        super(MovieNowPlayingInitial()) {
    on<MovieNowPlayingEvent>((event, emit) {
      emit(MovieNowPlayingLoading());
    });

    on<LoadMoviesNowPlaying>((event, emit) async {
      final movieNowPlaying = await _getMovieNowPlaying(NoParams());
      movieNowPlaying.fold(
          (l) => print(l.errorMessage), (r) => emit(MoviesNowPlayingLoaded(r)));
    });
  }
}
