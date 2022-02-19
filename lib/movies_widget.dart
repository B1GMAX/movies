import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/home_screen_bloc.dart';
import 'movide_state.dart';
import 'movie_details_screen.dart';

class MoviesWidget extends StatelessWidget {
  final MovieState movieState;

  const MoviesWidget({required this.movieState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: context.read<HomeScreenBloc>().scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.7,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        crossAxisCount: 2,
      ),
      itemCount: movieState.movieModalList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDescriptionScreen(
                  movie: movieState.movieModalList[index],
                ),
              ),
            );
          },
          child: Column(
            children: [
              Image.network(
                movieState.movieModalList[index].poster,
                errorBuilder: (c, _, __) => Image.asset(
                  'assets/zamena.jpg',
                  width: 150,
                  height: 215,
                ),
                fit: BoxFit.cover,
                width: 150,
                height: 215,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFE98D4B),
                  ),
                  Text(
                    '${movieState.movieModalList[index].rating}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    '/10',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Text(
                movieState.movieModalList[index].title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
