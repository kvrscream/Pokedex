import 'dart:convert';
import 'package:pokedesk/models/ListPokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedesk/models/detail_pokemon_model.dart';
import 'package:pokedesk/models/pokemon_model.dart';

class PokemonServices {
  final String url = "https://pokeapi.co/api/v2/pokemon";

  Future<ListPokemonModel> getPokemons(String? next) async {
    ListPokemonModel listPokemonModel = ListPokemonModel();
    try {
      var client = http.Client();
      var uri;

      if (next != null) {
        uri = Uri.parse(next);
      } else {
        uri = Uri.parse(url);
      }

      var response = await client.get(uri);
      var results = jsonDecode(response.body)["results"] as List<dynamic>;

      List<PokemonModel> pokemons =
          results.map((e) => PokemonModel.fromMap(e)).toList();

      listPokemonModel = ListPokemonModel.fromJson(response.body);
      listPokemonModel.results = pokemons;
    } catch (e) {
      print("erro ao listar todos os pokemons: " + e.toString());
    }
    return listPokemonModel;
  }

  Future<DetailPokemnonModel> searchPokemon(String nameOrId) async {
    DetailPokemnonModel pokemon = DetailPokemnonModel();
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url + "/" + nameOrId));
      pokemon = DetailPokemnonModel.fromJson(response.body);
    } catch (e) {
      print("erro ao buscar pokemon: " + e.toString());
    }

    return pokemon;
  }
}
