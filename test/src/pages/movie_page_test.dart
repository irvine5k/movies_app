import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/movie_page.dart';

void main() {

  const _json = {
    "poster_path": "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg",
    "genre_ids": [28, 12, 35, 14],
    "title": "Jumanji: The Next Level",
    "overview":
        "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.",
    "release_date": "2019-12-04"
  };

  final _movie = MovieModel.fromJson(_json);

  testWidgets(
    'When create page '
    'Should show the correct widgets',
    (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MoviePage(
            movie: _movie,
            isTest: true,
          ),
        ),
      );

      await tester.pump();

      expect(find.text('Movie Details'), findsOneWidget);
      
      expect(find.text(_movie.title), findsOneWidget);
      expect(find.text(_movie.genres), findsOneWidget);
      expect(find.text(_movie.formatedReleasedData),
          findsOneWidget);
      expect(find.text(_movie.overview), findsOneWidget);
    },
  );
}
