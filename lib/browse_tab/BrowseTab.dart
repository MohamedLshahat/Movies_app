import 'package:flutter/material.dart';
import 'package:movies/api/model/Responses/Genre.dart';
import 'package:movies/browse_tab/BrowseCard.dart';

import '../api/ApiManager.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

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
                      'Browse Category',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.left,
                    )),
                Expanded(
                  child: FutureBuilder(
                      future: ApiManager.getGenres(),
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.amber,
                            ),
                          );
                        }

                        List<Genre>? genres = snapshot.data?.genres;

                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                          ),
                          itemBuilder: (_, index) {
                            return BrowseCard(
                              genre: genres?[index],
                            );
                          },
                          itemCount: genres?.length,
                        );
                      }),
                ),
              ],
            )));
  }
}
