import 'package:dio/dio.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/services/movies_service.dart';
import 'package:rxdart/rxdart.dart';

class SearchMoviesBloc {
  final MoviesService moviesService;
  final _query = BehaviorSubject<String>();
  final _page = BehaviorSubject<int>();

  Stream<List<MovieModel>> _results;

  Sink<String> get setQuery => _query.sink;
  Sink get setPage => _page.sink;
  Stream<List<MovieModel>> get getResults => _results;

  SearchMoviesBloc(this.moviesService) {
    _results = _query
        .distinct()
        .where((e) => e.length >= 3)
        .debounceTime(Duration(milliseconds: 250))
        .switchMap(
          (query) => _page
              .startWith(0)
              .mapTo(1)
              .scan((acc, curr, i) => acc + curr, 0)
              .asyncMap(
                (i) => moviesService.search(query, i),
              )
              .scan<List<MovieModel>>(
                  (acc, curr, i) => acc..addAll(List.from(curr)), []),
        );
  }

  void dispose() {
    _query.close();
    _page.close();
  }
}
