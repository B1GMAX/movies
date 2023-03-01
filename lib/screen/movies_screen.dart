import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/error_widget.dart';
import '../bloc/movie_bloc.dart';
import 'loading_screen_widget.dart';

import '../state/movide_state.dart';
import '../widget/movies_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MovieBloc()..getMovieData(0),
      child: Scaffold(
        backgroundColor: const Color(0xFF161616),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            return !state.errorOccurred
                ? state.dataLoaded
                    ? MoviesWidget(
                        movieState: state,
                      )
                    : const LoadingScreenWidget()
                : const ErrorScreenWidget();
          },
        ),
      ),
    );
  }
}
