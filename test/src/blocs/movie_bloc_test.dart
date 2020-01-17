import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/blocs/movie_bloc.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/services/movies_service.dart';

class MockService extends Mock implements MoviesService {}

void main() {
  const _json = {
    "poster_path": "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg",
    "genre_ids": [28, 12, 35, 14],
    "title": "Jumanji: The Next Level",
    "overview":
        "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.",
    "release_date": "2019-12-04"
  };

  MockService service;
  UpcomingMoviesBloc bloc;

  final list = [
    MovieModel.fromJson(_json),
  ];

  final list2 = [
    MovieModel.fromJson(_json),
    MovieModel.fromJson(_json),
  ];

  final listComplete = [...list, ...list2];

  setUp(() {
    service = MockService();
    bloc = UpcomingMoviesBloc(service);

    when(service.getUpcomingMovies(1)).thenAnswer(
      (_) => Future<List<MovieModel>>.value(list),
    );

    when(service.getUpcomingMovies(2)).thenAnswer(
      (_) => Future<List<MovieModel>>.value(list2),
    );
  });
  test(
    'When start bloc '
    'Should emits the correct list of movies',
    () async {
      expect(bloc.getMovies, emits(list));
    },
  );

  test(
      'When set next page '
      'Should emits the correct list of movies', () async {
    bloc.setPage.add(2);

    await expectLater(bloc.getMovies, emits(listComplete));
  });
}
