import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/features/movie/presentation/blocs/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_item_now_playing.dart';

class MovieNowPlaying extends StatelessWidget {
  const MovieNowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: BlocConsumer<MovieNowPlayingBloc, MovieNowPlayingState>(
        listener: (context, state) {
          if (state is MovieNowPlayingError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
          }
        },
        builder: (context, state) {
          if (state is MovieNowPlayingLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppPallete.primary,
              ),
            );
          }
          if (state is MoviesNowPlayingLoaded) {
            return Swiper(
              itemCount: state.movies.length,
              viewportFraction: 0.69,
              scale: 0.9,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return MovieItemNowPlaying(
                  movie: movie,
                ); // Memanggil widget MovieItem
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
