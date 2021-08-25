import 'package:flutter/material.dart';
import 'package:pokedesk/models/ListPokemon_model.dart';
import 'package:pokedesk/models/pokemon_model.dart';
import 'package:pokedesk/services/pokemon_services.dart';

class HomeController {
  final pokemonsNotifier = ValueNotifier<List<PokemonModel>>(<PokemonModel>[]);
  List<PokemonModel> get pokemons => pokemonsNotifier.value;
  set pokemons(List<PokemonModel> value) => pokemonsNotifier.value = value;

  HomeController() {
    getPokemons();
  }

  Future<void> getPokemons() async {
    ListPokemonModel pokemonList = await PokemonServices().getPokemons();
    try {
      pokemons = pokemonList.results!;
    } catch (e) {
      print(e.toString());
    }
    return;
  }
}
