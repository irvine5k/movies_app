import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/services/movies_service.dart';

class MockDio extends Mock implements Dio {}

void main() {
  MockDio dio;
  MoviesService moviesService;

  const _json = {
    "results": [
      {
        "popularity": 185.437,
        "vote_count": 1079,
        "video": false,
        "poster_path": "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg",
        "id": 512200,
        "adult": false,
        "backdrop_path": "/zTxHf9iIOCqRbxvl8W5QYKrsMLq.jpg",
        "original_language": "en",
        "original_title": "Jumanji: The Next Level",
        "genre_ids": [28, 12, 35, 14],
        "title": "Jumanji: The Next Level",
        "vote_average": 6.7,
        "overview":
            "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.",
        "release_date": "2019-12-04"
      },
    ]
  };

  setUp(() {
    dio = MockDio();
    moviesService = MoviesService(dio);

    when(dio.get(any)).thenAnswer(
      (_) => Future.value(
        Response(data: _json),
      ),
    );
  });

  test(
      'When search movies '
      'Should return the correct movies', () async {
    final list = await moviesService.search('any', 1);
    final movie = list.first;

    expect(list.length, 1);
    expect(list.contains(movie), true);
  });

  test(
      'When get upcoming movies '
      'Should return the correct movies', () async {
    final list = await moviesService.getUpcomingMovies(1);
    final movie = list.first;

    expect(list.length, 1);
    expect(list.contains(movie), true);
  });
}
