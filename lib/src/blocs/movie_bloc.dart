import 'package:dio/dio.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/services/movies_service.dart';
import 'package:rxdart/rxdart.dart';

class UpcomingMoviesBloc {
  final MoviesService moviesService;

  final _page = BehaviorSubject<int>();
  final _upcomingPage = BehaviorSubject<int>();

  Stream<List<MovieModel>> _upcomingMovies;

  Sink get setPage => _upcomingPage.sink;
  Stream<List<MovieModel>> get getMovies => _upcomingMovies;

  UpcomingMoviesBloc(this.moviesService) {
    _upcomingMovies = _upcomingPage
        .startWith(0)
        .mapTo(1)
        .scan((acc, curr, i) => acc + curr, 0)
        .asyncMap(
          (i) => moviesService.getUpcomingMovies(i),
        )
        .scan<List<MovieModel>>(
            (acc, curr, i) => acc..addAll(List.from(curr)), []);
  }

  void dispose() {
    _page.close();
    _upcomingPage.close();
  }
}
