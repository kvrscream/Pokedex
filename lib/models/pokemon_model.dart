import 'dart:convert';

class PokemonModel {
  final String name;
  final String url;
  PokemonModel({required this.name, required this.url});

  Map<String, dynamic> toMap() => {"name": name, "url": url};

  //String toJson() = jsonEncode(toMap());

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(name: map["name"], url: map["url"]);
  }

  factory PokemonModel.fromJson(String json) =>
      PokemonModel.fromMap(jsonDecode(json));
}
