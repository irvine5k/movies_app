import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

class MovieModel {
  String posterPath;

  String backdropPath;

  List<int> genreIds;
  String title;

  String overview;
  DateTime releaseDate;

  MovieModel({
    this.posterPath,
    this.backdropPath,
    this.genreIds,
    this.title,
    this.overview,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );
}
