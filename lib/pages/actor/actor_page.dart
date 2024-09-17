import 'package:flutter/material.dart';
import 'package:movieapp_checkpoint4/models/movie_model.dart';
import 'package:movieapp_checkpoint4/pages/top_rated/widgets/top_rated_movie.dart';
import 'package:movieapp_checkpoint4/services/api_services.dart';

class ActorPage extends StatefulWidget {
  const ActorPage({super.key});

  @override
  State<ActorPage> createState() => _ActorPAgePageState();
}

class _ActorPAgePageState extends State<ActorPage> {
  ApiServices apiServices = ApiServices();
  late Future<Result> moviesFuture;

  @override
  void initState() {
    moviesFuture = apiServices.getTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
      ),
      body: FutureBuilder<Result>(
          future: moviesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.movies.length,
                itemBuilder: (context, index) {
                  return TopRatedMovie(movie: snapshot.data!.movies[index]);
                },
              );
            }

            return const Center(
              child: Text('No data found'),
            );
          }),
    );
  }
}
