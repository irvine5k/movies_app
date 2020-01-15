import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/blocs/movie_bloc.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/search_page.dart';
import 'package:movies_app/src/services/movies_service.dart';
import 'package:movies_app/src/widgets/movie_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  UpcomingMoviesBloc _moviesBloc;

  @override
  void initState() {
    _moviesBloc = UpcomingMoviesBloc(MoviesService(Dio()));
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 3) {
      _moviesBloc.setPage.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          StreamBuilder<List<MovieModel>>(
            stream: _moviesBloc.getMovies,
            builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
              return snapshot.hasData
                  ? Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => MovieCardWidget(
                          name: snapshot.data[index].title,
                          imagePath: snapshot.data[index].posterPath,
                          overview: snapshot.data[index].overview,
                          releaseDate: formatData(snapshot.data[index].releaseDate),
                          genre: snapshot.data[index].genreIds.first.toString(),
                        ),
                      ),
                    )
                  : Center(child: LinearProgressIndicator());
            },
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Text(
        'Movies',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        buildIconButton(context),
      ],
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          ),
        );
  }

  String formatData(DateTime date) => '${date.day}-${date.month}-${date.year}';

  @override
  void dispose() {
    _moviesBloc.dispose();
    _scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }
}
