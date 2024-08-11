import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/init_depedencies.dart';
import 'package:movie/src/core/network/bloc/network_bloc.dart';
import 'package:movie/src/core/screens/no_internet_page.dart';
import 'package:movie/src/core/theme/app_pallete.dart';
import 'package:movie/src/core/theme/app_theme.dart';
import 'package:movie/src/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie/src/features/movie/presentation/blocs/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:movie/src/features/movie/presentation/screens/home.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<MovieBloc>()),
      BlocProvider(create: (_) => serviceLocator<MovieNowPlayingBloc>()),
      BlocProvider(
        create: (_) => serviceLocator<NetworkBloc>()..add(CheckNetwork()),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonizerConfig(
      data: SkeletonizerConfigData(
        effect: ShimmerEffect(
            baseColor: Colors.grey.shade700,
            highlightColor: Colors.grey.shade500),
        justifyMultiLineText: true,
        ignoreContainers: true,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: BlocBuilder<NetworkBloc, NetworkState>(
          builder: (context, state) {
            if (state is NetworkLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppPallete.primary,
                  ),
                ),
              );
            }

            if (state is NetworkConnected) {
              return Home();
            }
            return const NoInternetPage();
          },
        ),
      ),
    );
  }
}
