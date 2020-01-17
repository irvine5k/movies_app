import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/search_page.dart';
import 'package:movies_app/src/services/movies_service.dart';

class MockService extends Mock implements MoviesService {}

void main() {
  MockService service;

  const _json = {
    "poster_path": "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg",
    "genre_ids": [28, 12, 35, 14],
    "title": "Jumanji: The Next Level",
    "overview":
        "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.",
    "release_date": "2019-12-04"
  };

  final list = [
    MovieModel.fromJson(_json),
  ];

  setUp(() {
    service = MockService();

    when(service.search(any, any)).thenAnswer(
      (_) => Future<List<MovieModel>>.value(list),
    );
  });
  testWidgets(
    'When create page '
    'Should show the correct widgets',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SearchPage(
            moviesService: service,
            isTest: true,
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'testeeee');

      await tester.pump(Duration(milliseconds: 300));
      
      expect(find.text('Search Movies'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    },
  );
}
