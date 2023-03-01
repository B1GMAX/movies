import 'package:movies/modal/person_modal.dart';

class MovieModal {
  final String bigPicture;
  final String title;
  final double rating;
  final String poster;
  final String description;
  final int year;
  final List<PersonModal> directors;
  final List<PersonModal> writers;
  final List<PersonModal> stars;
  final List<String> genres;
  final String mpaRating;
  final int duration;

  MovieModal(
      {required this.title,
      required this.duration,
      required this.mpaRating,
      required this.genres,
      required this.directors,
      required this.bigPicture,
      required this.description,
      required this.poster,
      required this.rating,
      required this.writers,
      required this.stars,
      required this.year});
}
