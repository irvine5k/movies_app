import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/src/blocs/search_bloc.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/services/movies_service.dart';
import 'package:movies_app/src/widgets/movie_card_widget.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchMoviesBloc _bloc;
  ScrollController _scrollController;

  @override
  void initState() {
    _bloc = SearchMoviesBloc(MoviesService(Dio()));
    _scrollController = ScrollController();
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 3) {
      _bloc.setPage.add(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: <Widget>[
          _buildSearch(),
          StreamBuilder<List<MovieModel>>(
            stream: _bloc.getResults,
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        'Search Movies',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }

  String formatData(DateTime date) => '${date.day}-${date.month}-${date.year}';

  Widget _buildSearch() => Container(
        height: MediaQuery.of(context).size.height * 0.08,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _buildFormField(),
      );

  Widget _buildFormField() => TextField(
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.035,
          color: Colors.blue,
        ),
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          hoverColor: Colors.white,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
        onChanged: _bloc.setQuery.add,
      );

  @override
  void dispose() {
    _bloc.dispose();
    _scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }
}
