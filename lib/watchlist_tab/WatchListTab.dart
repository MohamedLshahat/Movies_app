import 'package:flutter/material.dart';
import 'package:movies/search_tab/SearchMovieCard.dart';
import 'package:movies/database/collections/MoviesCollection.dart';
import 'package:movies/watchlist_tab/WatchListMovieCard.dart';

import '../api/model/Movie.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:
            const EdgeInsets.only(top: 32, left: 14, right: 14, bottom: 4),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Watch List',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.left,
                    )),
                Expanded(
                  child: StreamBuilder(
                      stream: Stream.fromFuture(MoviesCollection().getMovies()),
                      builder: (context, snapshot) {
                        List<Movie>? moviesList = snapshot.data;
                        if (snapshot.hasError || moviesList?.length==0 ) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                    image: AssetImage(
                                        'assets/images/noMovies icon.png')),
                                Text('No movies found '),
                              ],
                            ),
                          );
                        }

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(color: Colors.amber,),
                          );
                        }
                        return ListView.separated(
                          itemBuilder: (_, index) {
                            return WatchListMovieCard(
                              movie: moviesList![index],

                            );
                          },
                          separatorBuilder: (context, _) {
                            return Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.white,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                            );
                          },
                          itemCount: moviesList?.length ?? 1,
                        );
                      }),
                ),]),
                ));

  }
}
