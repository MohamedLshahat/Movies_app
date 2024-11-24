import 'package:flutter/material.dart';
import 'package:movies/api/model/Movie.dart';
import 'package:movies/common/WatchListButton.dart';
import 'package:movies/database/collections/MoviesCollection.dart';

import '../common/AddToWatchListWidget.dart';
import '../movie/MovieDetails.dart';

class SearchMovieCard extends StatefulWidget {
  final Movie movie;


  const SearchMovieCard(
      {
      required this.movie,

      super.key});

  @override
  State<SearchMovieCard> createState() => _SearchMovieCardState();
}

class _SearchMovieCardState extends State<SearchMovieCard> {
  bool isAddedToWatchList = false;
  MoviesCollection moviesCollection =MoviesCollection();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routeName,
            arguments: widget.movie.id);
      },
      child: Row(
        children: [
          Container(
            width: 150,
            height: 165,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topLeft,
            child: Watchlistbutton(movie: widget.movie),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 175,
                child: Text(
                  widget.movie.title ?? 'Unknown',
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.movie.releaseDate ?? 'Soon',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ImageIcon(
                    AssetImage('assets/images/star icon.png'),
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${widget.movie.voteAverage?.toStringAsFixed(1) ?? 'Unrated'} Rate',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
