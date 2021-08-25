import 'dart:convert';

import 'package:pokedesk/models/pokemon_model.dart';

class ListPokemonModel {
  final String? next;
  final String? previous;
  List<PokemonModel>? results;
  ListPokemonModel({this.next, this.previous, this.results});

  Map<String, dynamic> toMap() =>
      {"next": next, "previous": previous, "results": results};

  factory ListPokemonModel.fromMap(Map<String, dynamic> map) {
    return ListPokemonModel(next: map["next"], previous: map["previous"]);
  }

  factory ListPokemonModel.fromJson(String json) =>
      ListPokemonModel.fromMap(jsonDecode(json));

  ListPokemonModel copyWith({next, previous, results}) {
    return ListPokemonModel(
        next: next ?? this.next,
        previous: previous ?? this.next,
        results: results ?? this.results);
  }
}
