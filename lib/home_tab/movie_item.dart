import 'package:flutter/material.dart';
import 'package:movies/api/model/Responses/MoviesResponse.dart';
import 'package:movies/movie/MovieCard.dart';

import '../api/model/Movie.dart';

class MovieItem extends StatefulWidget {
  final Future<MoviesResponse?> futureFunction;

  const MovieItem({super.key, required this.futureFunction});

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureFunction,
      builder: (context, snapshot) {
        List<Movie>? moviesList = snapshot.data?.results;
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: moviesList?.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: moviesList![index],
                  movieTitle: moviesList[index].title,
                  movieImagePath: moviesList[index].posterPath,
                  movieId: moviesList[index].id,
                  movieRating: moviesList[index].voteAverage,
                  releaseDate: moviesList[index].releaseDate,
                );
              },
            ),
          );}
        else {
          return  SizedBox(
            height: MediaQuery.of(context).size.height*.2,
            child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                )),
          );
        }
      },
    );
  }
}
