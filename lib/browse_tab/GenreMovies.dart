import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';
import 'package:movies/api/model/Movie.dart';
import 'package:movies/api/model/Responses/Genre.dart';
import 'package:movies/movie/MovieCard.dart';

class GenreMovies extends StatelessWidget {
  static const String routeName = 'GenreMovies';

  const GenreMovies({super.key});

  @override
  Widget build(BuildContext context) {
    Genre genre = ModalRoute.of(context)?.settings.arguments as Genre;

    return FutureBuilder(
        future: ApiManager.getGenreMovies(genreId: ' ${genre.id}'),
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

          List<Movie>? movies = snapshot.data?.results;
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  genre.name ?? '',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              body: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Column(children: [
                    Expanded(
                        child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 4,
                      ),
                      itemBuilder: (_, index) {
                        return MovieCard(
                          movie: movies![index],
                          movieTitle: movies[index].title,
                          movieImagePath: movies[index].posterPath,
                          movieId: movies[index].id,
                          releaseDate: movies[index].releaseDate,
                          movieRating: movies[index].voteAverage,
                        );
                      },
                      itemCount: movies?.length,
                    ))
                  ])));
        });
  }
}
