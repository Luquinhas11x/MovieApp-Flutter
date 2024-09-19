import 'package:flutter/material.dart';
import 'package:movieapp_checkpoint4/models/actor_model.dart';
import 'package:movieapp_checkpoint4/pages/actor/widgets/actor_card.dart';
import 'package:movieapp_checkpoint4/services/api_services.dart';

class ActorPage extends StatefulWidget {
  const ActorPage({super.key});

  @override
  State<ActorPage> createState() => _ActorPAgePageState();
}

class _ActorPAgePageState extends State<ActorPage> {
  ApiServices apiServices = ApiServices();
  late Future<ResultsActor> actorsFuture;

  @override
  void initState() {
    actorsFuture = apiServices.getActorsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actors'),
      ),
      body: FutureBuilder<ResultsActor>(
          future: actorsFuture,
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
                itemCount: snapshot.data!.results.length,
                itemBuilder: (context, index) {
                  return ActorCard(actor: snapshot.data!.results[index]);
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
