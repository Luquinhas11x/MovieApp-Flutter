import 'package:flutter/material.dart';
import 'package:movieapp_checkpoint4/common/utils.dart';
import 'package:movieapp_checkpoint4/models/actor_detail_model.dart';
import 'package:movieapp_checkpoint4/services/api_services.dart';

class ActorDetailPage extends StatefulWidget {
  final int actorId;
  const ActorDetailPage({super.key, required this.actorId});

  @override
  State<ActorDetailPage> createState() => _ActorDetailPageState();
}

class _ActorDetailPageState extends State<ActorDetailPage> {
  ApiServices apiServices = ApiServices();

  late Future<ActorDetailModel> actorDetail;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    actorDetail = apiServices.getActorDetail(widget.actorId);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          Colors.black87, // Fundo mais escuro para estilo de cinema
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: actorDetail,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final actor = snapshot.data;

              return Column(
                children: [
                  // Banner do ator
                  Stack(
                    children: [
                      Container(
                        height: size.height * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage("$imageUrl${actor!.profilePath}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black87],
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Detalhes do ator
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actor.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.cake, color: Colors.grey[400]),
                            const SizedBox(width: 10),
                            Text(
                              'Nascimento: ${actor.birthday.isNotEmpty ? actor.birthday : 'Indisponível'}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.grey[400]),
                            const SizedBox(width: 10),
                            Text(
                              'Local de nascimento: ${actor.placeOfBirth.isNotEmpty ? actor.placeOfBirth : 'Indisponível'}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            const SizedBox(width: 10),
                            Text(
                              'Popularidade: ${actor.popularity.toStringAsFixed(1)}',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Biografia',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          actor.biography.isNotEmpty
                              ? actor.biography
                              : 'Biografia indisponível',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
