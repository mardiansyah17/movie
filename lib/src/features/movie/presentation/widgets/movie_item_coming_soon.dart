import 'package:flutter/material.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/features/movie/domain/entities/movie.dart';

class MovieItemComingSoon extends StatelessWidget {
  final Movie movie;
  const MovieItemComingSoon({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      // color: Colors.amber,
      width: 175,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              fit: BoxFit.cover,
              "https://image.tmdb.org/t/p/w300/${movie.posterPath}",
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  "assets/images/no_image.png",
                  height: 250,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            movie.title,
            style: const TextStyle(fontSize: 16, color: AppPallete.primary),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text("Action, adventure, sci-fi",
                style: TextStyle(color: Color(0xffDEDEDE), fontSize: 12)),
          )
        ],
      ),
    );
  }
}
