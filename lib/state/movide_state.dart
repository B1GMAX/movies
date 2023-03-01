import 'package:movies/modal/movie_modal.dart';

class MovieState {
  final List<MovieModal> movieModalList;
  final bool dataLoaded;
  final bool errorOccurred;

  MovieState(
      {required this.movieModalList,
      required this.dataLoaded,
      required this.errorOccurred});

  MovieState copyWith({
    List<MovieModal>? movieModalList,
    bool? dataLoaded,
    bool? errorOccurred,
  }) =>
      MovieState(
        dataLoaded: dataLoaded ?? this.dataLoaded,
        movieModalList: movieModalList ?? this.movieModalList,
        errorOccurred: errorOccurred ?? this.errorOccurred,
      );
}
