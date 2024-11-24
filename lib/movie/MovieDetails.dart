import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';

import '../home_tab/movie_item.dart';

String? getHoursAndMins(num? time) {
  if (time != null) {
    var hours = time ~/ 60;
    var mins = time % 60;
    return ('${hours}h  ${mins}m');
  }
  return null;
}

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movie_details';

  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    num movieId = ModalRoute.of(context)!.settings.arguments as num;
    return FutureBuilder(
        future: ApiManager.getMovieDetails(movieId: movieId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Column(
                children: [
                  Text('Something went wrong!'),
                ],
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          var movieDetails = snapshot.data;
          movieDetails.runtimeType.toString();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                movieDetails?.title ?? 'Unknown Movie name',
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: (movieDetails?.posterPath != null)
                                ? NetworkImage(
                                    '${ApiManager.posterPath}${movieDetails?.posterPath}')
                                : const AssetImage(
                                    'assets/images/movie_poster.png'),
                            fit: BoxFit.cover)),
                    child: const ImageIcon(
                      AssetImage('assets/images/play-button.png'),
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieDetails?.title ?? 'Unknown Movie name',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          movieDetails?.releaseDate ?? 'soon',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          getHoursAndMins(movieDetails?.runtime) ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 175,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: (movieDetails?.posterPath != null)
                                          ? NetworkImage(
                                              '${ApiManager.posterPath}${movieDetails?.posterPath}')
                                          : const AssetImage(
                                              'assets/images/movie_poster.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 200,
                                    height: 135,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        movieDetails?.overview ??
                                            'movie story ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        textAlign: TextAlign.left,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    const ImageIcon(
                                      AssetImage('assets/images/star icon.png'),
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      movieDetails?.voteAverage
                                              ?.toStringAsFixed(1) ??
                                          'rating',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 325,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
                    decoration: const BoxDecoration(color: Colors.white12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Like This',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        MovieItem(
                          futureFunction:
                              ApiManager.getSimilarMovies(movieId: movieId),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
