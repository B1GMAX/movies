import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'error_widget.dart';
import 'home_screen_bloc.dart';
import 'loading_screen_widget.dart';
import 'movie_details_screen.dart';
import 'movide_state.dart';
import 'movies_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenBloc()..getMovieData(),
      child: Scaffold(
        backgroundColor: const Color(0xFF161616),
        body: BlocBuilder<HomeScreenBloc, MovieState>(
          builder: (context, state) {
            return !state.errorOccurred
                ? state.dataLoaded
                    ? MoviesWidget(movieState: state,)
                    : const LoadingScreenWidget()
                : const ErrorScreenWidget();
          },
        ),
      ),
    );
  }
}
