import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:movies/movie_modal.dart';
import 'package:movies/person.dart';

class MovieDescriptionScreen extends StatelessWidget {
  final MovieModal movie;

  const MovieDescriptionScreen({required this.movie, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            movie.bigPicture,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 1.6,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 0.6, 0.6],
                colors: [
                  Colors.transparent,
                  Color(0xFF161616),
                  Color(0xFF161616),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 30, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '(${movie.year})',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  movie.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      movie.genres.isNotEmpty
                          ? _combineGenres(movie.genres)
                          : '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${movie.rating}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '|',
                      style: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      formatMovieDuration(movie.duration),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Directors:',
                        style: TextStyle(
                            color: Color(0xFFE2E2E2),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: _combineNames(movie.directors),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Writers:',
                      style: TextStyle(
                          color: Color(0xFFE2E2E2),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      _combineNames(movie.writers),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Stars:',
                        style: TextStyle(
                            color: Color(0xFFE2E2E2),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      TextSpan(
                        text: movie.stars.isNotEmpty
                            ? _combineNames(movie.stars)
                            : '',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'iMDb ratting',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFE98D4B),
                            ),
                            Text(
                              '${movie.rating}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Text(
                              '/10',
                              style: TextStyle(
                                  color: Color(0xFFE2E2E2),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFDA1617)),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.play_arrow_rounded),
                              Text(' Watch trailer'),
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 25),
              child: SvgPicture.asset('assets/back_arrow.svg'),
            ),
          ),
        ],
      ),
    );
  }

  String _combineNames(List<Person> list) {
    String names = '';
    for (var element in list) {
      names += '${element.firstName} ${element.lastName} ,';
    }
    return names.substring(0, names.length - 1);
  }

  String _combineGenres(List<String> list) {
    String genres = '';
    for (var element in list) {
      genres += '$element,';
    }
    return genres.substring(0, genres.length - 1);
  }

  String formatMovieDuration(int time) {
    int h = time ~/ 60;
    int min = time;
    if (time > 59) {
      int min = (time - h * 60);
      return '$h h $min m';
    } else {
      return '$min min';
    }
  }
}
