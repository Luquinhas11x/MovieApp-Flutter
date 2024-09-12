import 'package:flutter/material.dart';
import 'package:movieapp_checkpoint4/common/utils.dart';
import 'package:movieapp_checkpoint4/models/movie_model.dart';
import 'package:intl/intl.dart';
import 'package:movieapp_checkpoint4/pages/movie_detail/movie_detail.dart';

class MovieSearch extends StatelessWidget {
  const MovieSearch({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieDetailPage(
                    movieId: movie.id,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FadeInImage(
                    image: NetworkImage('$imageUrl${movie.posterPath}'),
                    fit: BoxFit.cover,
                    placeholder: const AssetImage("images/netflix.png")),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      movie.releaseDate == null
                          ? ''
                          : DateFormat("d 'de' MMM 'de' y")
                              .format(movie.releaseDate!),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${movie.voteAverage.toStringAsFixed(1)}/10',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
