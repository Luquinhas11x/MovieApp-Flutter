import 'dart:convert';

class ResultsActor {
  int page;
  List<Actor> results;
  int totalPages;
  int totalResults;

  ResultsActor({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults
    });

  factory ResultsActor.fromRawJson(String str) => ResultsActor.fromJson(json.decode(str));

  factory ResultsActor.fromJson(Map<String, dynamic> json) => ResultsActor(
    page: json["page"],
    results: List<Actor>.from(json["results"].map((x) => Actor.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}

class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;

  Actor(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.popularity,
      required this.profilePath});

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
    adult: json['adult'] ?? false, 
    gender: json['gender'] ?? '', 
    id: json['id'] ?? 0, 
    knownForDepartment: json['known_for_department'] ?? '', 
    name: json['name'] ?? '', 
    originalName: json['original_name'] ?? '', 
    popularity: json['popularity'] ?? '', 
    profilePath: json['profile_path'] ?? '', );
}
