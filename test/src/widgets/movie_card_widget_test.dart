import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/widgets/movie_card_widget.dart';

void main() {
  final _posterPath = "/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg";
  final _genreIds = [28, 12, 35, 14];
  final _title = "Jumanji: The Next Level";
  final _overview =
      "As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.";
  final _releaseDate = DateTime.parse("2019-12-04");
  final _movie = MovieModel(
    posterPath: _posterPath,
    genreIds: _genreIds,
    title: _title,
    overview: _overview,
    releaseDate: _releaseDate,
  );
  testWidgets(
      'When create widget '
      'Should find the correct widgets', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: MovieCardWidget(
            movie: _movie,
            isTest: true,
          ),
        ),
      ),
    );

    await tester.pump();

    expect(find.text(_title), findsOneWidget);
    expect(find.text('Release: ${_movie.formatedReleasedData}'), findsOneWidget);
    expect(find.text(_movie.genres), findsOneWidget);
  });
}
