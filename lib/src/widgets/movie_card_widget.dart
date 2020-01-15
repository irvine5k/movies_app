import 'package:flutter/material.dart';
import 'package:movies_app/src/models/movie_model.dart';
import 'package:movies_app/src/pages/movie_page.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieModel movie;

  final bool isTest;

  const MovieCardWidget({
    Key key,
    @required this.movie,
    this.isTest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    image: isTest
                        ? null
                        : DecorationImage(
                            image: NetworkImage(
                              'http://image.tmdb.org/t/p/w185/${movie.posterPath}',
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        movie.title,
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        movie.genres,
                        style: TextStyle(color: Colors.blue),
                      ),
                      Text(
                        'Release: ${movie.formatedReleasedData}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MoviePage(
            movie: movie,
          ),
        ),
      ),
    );
  }
}
