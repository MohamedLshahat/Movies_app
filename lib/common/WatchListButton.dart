import 'package:flutter/material.dart';
import 'package:movies/common/AddToWatchListWidget.dart';
import 'package:movies/database/collections/MoviesCollection.dart';

import '../api/model/Movie.dart';

class Watchlistbutton extends StatefulWidget {
  final Movie movie;
  Watchlistbutton({required this.movie,super.key});

  @override
  State<Watchlistbutton> createState() => _WatchlistbuttonState();
}

class _WatchlistbuttonState extends State<Watchlistbutton> {
  final MoviesCollection moviesCollection = MoviesCollection();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:moviesCollection.isMovieInWatchlist('${widget.movie.id}'),

        builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const CircularProgressIndicator(color: Colors.white,strokeWidth: 2,);
    }
    bool isInWatchList = snapshot.data ?? false ;

    return InkWell(
      onTap: ()
      {
        setState(() {

           (isInWatchList)
               ? moviesCollection.deleteMovie('${widget.movie.id}')
               : moviesCollection.addMovies(widget.movie);

        });


              },
      child: (isInWatchList)
          ?AddToWatchListWidget(markColor: Colors.amberAccent,icon: Icons.check,)
          :AddToWatchListWidget()

    );
    });
  }
}
