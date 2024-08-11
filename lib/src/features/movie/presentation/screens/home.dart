import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/features/movie/presentation/blocs/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/src/features/movie/presentation/widgets/header_list_movie.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_coming_soon.dart';
import 'package:movie/src/features/movie/presentation/widgets/movie_now_playing.dart';
import 'package:movie/src/features/movie/presentation/widgets/search_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _globalKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    context.read<MovieNowPlayingBloc>().add(LoadMoviesNowPlaying());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Text("Hi, Muhammad Mardiansyah"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: AppPallete.white,
              ))
        ],
      ),
      body: const SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBox(),
            SizedBox(
              height: 30,
            ),
            HeaderListMovie(
              title: "Sedang tayang",
            ),
            MovieNowPlaying(),
            SizedBox(
              height: 10,
            ),
            HeaderListMovie(
              title: "Segera tayang",
            ),
            SizedBox(
              height: 10,
            ),
            MovieComingSoon(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}
