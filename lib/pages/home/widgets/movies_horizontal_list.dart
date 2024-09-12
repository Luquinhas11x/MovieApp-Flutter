import 'package:flutter/material.dart';
import 'package:movieapp_checkpoint4/models/movie_model.dart';
import 'package:movieapp_checkpoint4/pages/home/widgets/movie_horizontal_item.dart';

class MoviesHorizontalList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieHorizontalItem(movie: movies[index]);
        },
      ),
    );
  }
}
