import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';
import 'package:movies/common/WatchListButton.dart';
import 'package:movies/movie/MovieDetails.dart';

import '../api/model/Movie.dart';
import '../common/AddToWatchListWidget.dart';
import '../database/collections/MoviesCollection.dart';

class MovieCard extends StatefulWidget {
    final Movie movie;
    final num? movieId;
    final String? movieTitle;
    final num? movieRating;
    final String? releaseDate;
    final String? movieImagePath;

  const MovieCard(
      {
      required this.movie,
      required this.movieTitle,
      required this.movieImagePath,
      required this.movieId,
      this.movieRating,
      this.releaseDate,
      super.key});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isInWatchList =false;
  MoviesCollection moviesCollection =MoviesCollection();

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      splashColor: Colors.transparent,
      highlightColor:Colors.transparent ,
      onTap: (){
        Navigator.pushNamed(context, MovieDetails.routeName,
            arguments: widget.movieId);
      },
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: NetworkImage(
                    '${ApiManager.posterPath}${widget.movieImagePath}'),
                fit: BoxFit.fitWidth,
              ),
            ),
            alignment: Alignment.topLeft,
            child: Watchlistbutton(movie: widget.movie),
            ),
          ),
            const SizedBox(height: 7,),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star,
              size: 19,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.movieRating?.toStringAsFixed(1) ?? "Unrated",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              widget.releaseDate ?? "Soon",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            widget.movieTitle ?? 'Unknown',
            style: const TextStyle(fontSize: 18, color: Colors.white70),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}
