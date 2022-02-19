import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:movies/person.dart';
import 'movide_state.dart';
import 'movie_modal.dart';

class HomeScreenBloc extends BlocBase<MovieState> {
  HomeScreenBloc()
      : super(
          MovieState(
            movieModalList: [],
            dataLoaded: false,
            errorOccurred: false,
          ),
        ) {
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          ++_page;
          if (_page < _limitPages) {
            print('p-$_page');

            getMovieData(_page);
          }
        }
      },
    );
  }

  int _page = 0;
  int _limitPages = 0;
  final ScrollController scrollController = ScrollController();

  Future<void> getMovieData(int page) async {
    try {
      final response = await get(Uri.parse(
          'https://live.mocat.amifactory.network/api/v1/movies/?page=$page'));
      if (response.statusCode == 200) {
        state.movieModalList.addAll(_parseData(response.body));
        emit(state.copyWith(dataLoaded: true, errorOccurred: false));
      } else {
        emit(state.copyWith(errorOccurred: true));
      }
    } catch (e) {
      emit(state.copyWith(errorOccurred: true));
    }
  }

  List<MovieModal> _parseData(String json) {
    final List<MovieModal> movieInformation = [];
    final Map<String, dynamic> jsonMap = jsonDecode(json);
    final List results = jsonMap['results'];
    _limitPages = jsonMap['pages'];
    for (int i = 0; i < results.length; i++) {
      final List<Person> directorsList = [];
      final List<Person> writersList = [];
      final List<Person> starsList = [];
      final List<String> genresList = [];
      final String title = results[i]['title'];
      final String bigPicture = results[i]['bg_picture'];
      final double rating = results[i]['imdb_rating'];
      final String poster = results[i]['poster'];
      final int releaseYear = results[i]['release_year'];
      final String description = results[i]['description'];
      final List directors = results[i]['directors'];
      for (int a = 0; a < directors.length; a++) {
        final String directorFirstName = directors[a]['first_name'];
        final String directorLastName = directors[a]['last_name'];
        directorsList.add(
            Person(lastName: directorLastName, firstName: directorFirstName));
      }
      final List writers = results[i]['writers'];
      for (int b = 0; b < writers.length; b++) {
        final String writerFirstName = writers[b]['first_name'];
        final String writerLastName = writers[b]['last_name'];
        writersList
            .add(Person(lastName: writerLastName, firstName: writerFirstName));
      }
      final List stars = results[i]['stars'];
      for (int c = 0; c < stars.length; c++) {
        final String starFirstName = stars[c]['first_name'];
        final String starLastName = stars[c]['last_name'];
        starsList.add(Person(lastName: starLastName, firstName: starFirstName));
      }
      final List genres = results[i]['genres'];
      for (int d = 0; d < genres.length; d++) {
        final String genre = genres[d]['title'];
        genresList.add(genre);
      }
      final String mpRating = results[i]['mpa_rating'];
      final int duration = results[i]['duration'];

      movieInformation.add(MovieModal(
          duration: duration,
          mpaRating: mpRating,
          genres: genresList,
          stars: starsList,
          writers: writersList,
          directors: directorsList,
          description: description,
          year: releaseYear,
          title: title,
          bigPicture: bigPicture,
          poster: poster,
          rating: rating));
    }
    return movieInformation;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
