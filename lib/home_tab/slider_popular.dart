import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';

import '../api/model/Movie.dart';
import '../api/model/Responses/MoviesResponse.dart';

class SliderPopular extends StatelessWidget {
  final Future<MoviesResponse?> futureFunction;

  const SliderPopular({super.key, required this.futureFunction});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction,
      builder: (context, snapshot) {
        List<Movie>? moviesList = snapshot.data?.results;
        if (snapshot.connectionState == ConnectionState.done) {
          return CarouselSlider(
              items: moviesList?.map((movie) {
                return Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                '${ApiManager.posterPath}${movie.posterPath}'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  );
                });
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                height: MediaQuery.of(context).size.height * .3,
              ));
        }else{
          return SizedBox(
            height: MediaQuery.of(context).size.height*.3,
            child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                )),
          );
        }
      },);
  }
}
