import 'package:flutter/material.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_detail_actor_item.dart';

class MovieDetailActors extends StatelessWidget {
  const MovieDetailActors({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        physics: const ScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const MovieDetailActorItem();
        },
      ),
    );
  }
}
