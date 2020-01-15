import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/services/movies_service.dart';
import 'package:rxdart/rxdart.dart';

class UpcomingMoviesBloc {
  final _moviesService = MoviesService();
  final _page = BehaviorSubject<int>();
  final _upcomingPage = BehaviorSubject<int>();

  Stream<List<MovieModel>> _upcomingMovies;

  Sink get setPage => _upcomingPage.sink;
  Stream<List<MovieModel>> get getMovies => _upcomingMovies;

  UpcomingMoviesBloc() {
    _upcomingMovies = _upcomingPage
        .startWith(0)
        .mapTo(1)
        .scan((acc, curr, i) => acc + curr, 0)
        .asyncMap(
          (i) => _moviesService.getUpcomingMovies(i),
        )
        .scan<List<MovieModel>>(
            (acc, curr, i) => acc..addAll(List.from(curr)), []);

    _upcomingMovies.listen((e) => print('upcoming movies lenght ${e.length}'));
    _upcomingPage.listen((i) => print('Upcoming Page: $i'));
  }

  void dispose() {
    _page.close();
    _upcomingPage.close();
  }
}
