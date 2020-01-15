import 'dart:convert';

MovieModel movieAppFromJson(String str) => MovieModel.fromJson(json.decode(str));

String movieAppToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
    double popularity;
    int voteCount;
    bool video;
    String posterPath;
    int id;
    bool adult;
    String backdropPath;
    String originalLanguage;
    String originalTitle;
    List<int> genreIds;
    String title;
    double voteAverage;
    String overview;
    DateTime releaseDate;

    MovieModel({
        this.popularity,
        this.voteCount,
        this.video,
        this.posterPath,
        this.id,
        this.adult,
        this.backdropPath,
        this.originalLanguage,
        this.originalTitle,
        this.genreIds,
        this.title,
        this.voteAverage,
        this.overview,
        this.releaseDate,
    });

    MovieModel copyWith({
        double popularity,
        int voteCount,
        bool video,
        String posterPath,
        int id,
        bool adult,
        String backdropPath,
        String originalLanguage,
        String originalTitle,
        List<int> genreIds,
        String title,
        double voteAverage,
        String overview,
        DateTime releaseDate,
    }) => 
        MovieModel(
            popularity: popularity ?? this.popularity,
            voteCount: voteCount ?? this.voteCount,
            video: video ?? this.video,
            posterPath: posterPath ?? this.posterPath,
            id: id ?? this.id,
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            genreIds: genreIds ?? this.genreIds,
            title: title ?? this.title,
            voteAverage: voteAverage ?? this.voteAverage,
            overview: overview ?? this.overview,
            releaseDate: releaseDate ?? this.releaseDate,
        );

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
    );

    Map<String, dynamic> toJson() => {
        "popularity": popularity,
        "vote_count": voteCount,
        "video": video,
        "poster_path": posterPath,
        "id": id,
        "adult": adult,
        "backdrop_path": backdropPath,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "title": title,
        "vote_average": voteAverage,
        "overview": overview,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    };
}
