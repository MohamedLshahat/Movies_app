import 'package:flutter/material.dart';
import 'package:movies/api/ApiManager.dart';
import 'package:movies/api/model/Movie.dart';
import 'package:movies/search_tab/SearchMovieCard.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white24,
                contentPadding: const EdgeInsets.all(18),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Colors.white38,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
                    color: Colors.white38,
                    width: 2.0,
                  ),
                ),
              ),
              cursorColor: const Color(0xFF48CFAD),
              controller: controller,
              onChanged: (text) {
                setState(() {});
              },
            ),

            Expanded(
              child: FutureBuilder(
                  future: ApiManager.searchForMovie(controller.text),
                  builder: (context, snapshot) {
                    List<Movie>? moviesList = snapshot.data?.results;
                    if (snapshot.hasError || moviesList?.length ==0) {
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
                        return SearchMovieCard(
                          movie: moviesList[index],


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
                      itemCount: moviesList!.length,
                    );
                  }),
            ),

          ],),
      ),
    );
  }
}
