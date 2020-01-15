import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/models/movie_model.dart';

void main() {
  const _json = {
    "poster_path": "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg",
    "genre_ids": [28, 12],
    "title": "Jumanji: The Next Level",
    "overview":
        "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.",
    "release_date": "2019-12-04"
  };

  final _posterPath = "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg";
  final _genreIds = [28, 12];
  final _title = "Jumanji: The Next Level";
  final _overview =
      "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.";
  final _releaseDate = DateTime.parse("2019-12-04");

  test(
      'When construct a model '
      'Should present the correct atributes', () {
    final model = MovieModel(
      posterPath: _posterPath,
      genreIds: _genreIds,
      title: _title,
      overview: _overview,
      releaseDate: _releaseDate,
    );

    expect(model.genreIds, _genreIds);
    expect(model.title, _title);
    expect(model.releaseDate, _releaseDate);
    expect(model.posterPath, _posterPath);
    expect(model.overview, _overview);
  });

  test(
      'When construct a model from a JSON '
      'Should present the correct atributes', () {
    final model = MovieModel.fromJson(_json);

    expect(model.genreIds, _genreIds);
    expect(model.title, _title);
    expect(model.releaseDate, _releaseDate);
    expect(model.posterPath, _posterPath);
    expect(model.overview, _overview);
  });

  test(
      'When use getters '
      'Should present the correct values', () {
    final model = MovieModel(
      posterPath: _posterPath,
      genreIds: _genreIds,
      title: _title,
      overview: _overview,
      releaseDate: _releaseDate,
    );



    expect(model.formatedReleasedData, '4-12-2019');
    expect(model.genres, 'Action, Adventure');
  });
}
