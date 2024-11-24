import 'package:flutter/material.dart';
import 'package:movies/api/model/Responses/Genre.dart';
import 'package:movies/browse_tab/GenreMovies.dart';

String? getGenrePoster(String? genreName) {
  if (genreName != null && genreName != '') {
    return ('assets/images/genres/$genreName.jpg');
  }
  return null;
}

class BrowseCard extends StatelessWidget {
  final Genre? genre;

  const BrowseCard({required this.genre, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, GenreMovies.routeName, arguments: genre);
      },
      child: Container(
        height: 150,
        width: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(getGenrePoster(genre?.name) ??
                    'assets/images/defaultGenrePoster.png'),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black54, BlendMode.darken))),
        alignment: Alignment.center,
        child: Text(
          genre?.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
