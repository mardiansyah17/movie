import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_detail_actors.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_detail_heading.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_detail_row.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          print(state);
          if (state is MovieDetailLoaded) {
            return Stack(
              children: [
                Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w300/${state.movie.posterPath}",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 300),
                          width: double.infinity,
                          child: Container(
                            color: AppPallete.backgroundColor,
                            child: Padding(
                              padding: EdgeInsets.only(top: 150.0),
                              child: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          MovieDetailRow(
                                              label: "Genre", value: "tes"),
                                          const MovieDetailRow(
                                              label: "Bahasa",
                                              value: "Indonesia"),
                                          const MovieDetailRow(
                                              label: "Rating usia",
                                              value: "13+"),
                                          const MovieDetailRow(
                                              label: "Durasi",
                                              value: "2 jam 11 menit"),
                                          const MovieDetailRow(
                                              label: "Sutradara",
                                              value: "Sam Raimi"),
                                          const SizedBox(height: 20),
                                          const MovieDetailHeading(
                                            text: "Sinopsis",
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: const Text(
                                              "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          const MovieDetailHeading(
                                              text: "Pemeran"),
                                          const MovieDetailActors(),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 200,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 250,
                              child: Row(
                                children: [
                                  PhysicalModel(
                                    color: Colors.transparent,
                                    shadowColor: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 5,
                                    // child: Image.network(
                                    //   "https://image.tmdb.org/t/p/w300/${moviePosterPath}",
                                    //   height: 220,
                                    // ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Flexible(
                                          child: Text(
                                            state.movie.title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '9.5',
                                              style: TextStyle(
                                                  color: AppPallete.primary,
                                                  fontSize: 20),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const Center(
            child: Text('mantap'),
          );
        },
      ),
    );
  }
}
