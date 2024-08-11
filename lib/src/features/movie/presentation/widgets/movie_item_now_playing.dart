import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';
import 'package:movie/src/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/src/features/movie/presentation/screens/movie_detail_page.dart';
import 'package:page_transition/page_transition.dart';

class MovieItemNowPlaying extends StatelessWidget {
  final Movie movie;
  const MovieItemNowPlaying({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        context.read<MovieBloc>().add(FindMovie(id: movie.id));
      },
      child: Align(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    fit: BoxFit.cover,
                    "https://image.tmdb.org/t/p/w300/${movie.posterPath}",
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/images/no_image.png",
                        fit: BoxFit.cover,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppPallete.primary,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // RichText(
              //   text: TextSpan(
              //       text: "3h20m",
              //       style: TextStyle(color: Color(0xffBFBFBF)),
              //       children: [
              //         TextSpan(text: " • "),
              //         TextSpan(text: "Action, adventure, sci-fi")
              //       ]),
              // ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
