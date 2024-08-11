import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/src/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_item_coming_soon.dart';

class MovieComingSoon extends StatelessWidget {
  const MovieComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MoviePageLoaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.comingSoon.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoon[index];
                return MovieItemComingSoon(
                  movie: movie,
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
