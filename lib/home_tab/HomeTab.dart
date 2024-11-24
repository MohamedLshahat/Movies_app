import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';
import 'package:movies/home_tab/slider_popular.dart';

import 'movie_item.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 28,
                ),
                const Text(
                  'Popular',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                SliderPopular(futureFunction: ApiManager.getPopularMovies()),

                /// CarouselSlider
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'New Releases',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 17,
                ),
                MovieItem(futureFunction: ApiManager.getUpComingMovies()),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  'Recommended',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 17,
                ),
                MovieItem(futureFunction: ApiManager.getTopRatedMovies()),
                const SizedBox(
                  height: 17,
                ),
              ],
          )
          ],),
      ),
    );
  }
}