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

  String get formatedReleasedData =>
      '${releaseDate.day}-${releaseDate.month}-${releaseDate.year}';

   String get genres =>
      List<String>.from(genreIds.map((id) => genresList[id])).join(';');

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  Map<int, String> genresList = {
    28: "Action",
    12: "Adventure",
    16: "Animation",
    35: "Comedy",
    80: "Crime",
    99: "Documentary",
    18: "Drama",
    10751: "Family",
    14: "Fantasy",
    36: "History",
    27: "Horror",
    10402: "Music",
    9648: "Mystery",
    10749: "Romance",
    878: "Science Fiction",
    10770: "TV Movie",
    53: "Thriller",
    10752: "War",
    37: "Western"
  };

 
}
