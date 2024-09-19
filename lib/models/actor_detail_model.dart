
import 'dart:convert';

class ActorDetailModel {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  Null deathday;
  int gender;
  Null homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  ActorDetailModel(
      {required this.adult,
      required this.alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.deathday,
      required this.gender,
      required this.homepage,
      required this.id,
      required this.imdbId,
      required this.knownForDepartment,
      required this.name,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath});

  factory ActorDetailModel.fromRawJson(String str) =>
      ActorDetailModel.fromJson(json.decode(str));

  factory ActorDetailModel.fromJson(Map<String, dynamic> json) => ActorDetailModel(
    adult: json['adult'] ?? false,
    alsoKnownAs: json['also_known_as'].cast<String>() ?? '',
    biography: json['biography'] ?? '',
    birthday: json['birthday'] ?? '',
    deathday: json['deathday'] ?? '',
    gender: json['gender'] ?? 0,
    homepage: json['homepage'] ?? '',
    id: json['id'] ?? 0,
    imdbId: json['imdb_id'] ?? '',
    knownForDepartment: json['known_for_department'] ?? '',
    name: json['name'] ?? '',
    placeOfBirth: json['place_of_birth'] ?? '',
    popularity: json['popularity'] ?? '',
    profilePath: json['profile_path'] ?? '',
  );

}