import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final String name;
  final String relaseDate;
  final String overview;
  final String genre;
  final String imagePath;

  const MoviePage({
    Key key,
    @required this.name,
    @required this.relaseDate,
    @required this.overview,
    @required this.genre,
    @required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Movie Details',
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'http://image.tmdb.org/t/p/w185/$imagePath',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: Text('Name'),
                subtitle: Text(name),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: Text('Release Date'),
                subtitle: Text(relaseDate),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: Text('Genre'),
                subtitle: Text(genre),
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                title: Text('Overview'),
                subtitle: Text(overview),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

