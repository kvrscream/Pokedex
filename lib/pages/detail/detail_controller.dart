import 'package:flutter/material.dart';
import 'package:pokedesk/models/detail_pokemon_model.dart';
import 'package:pokedesk/services/pokemon_services.dart';

class DetailController {
  var pokemonNotifier =
      ValueNotifier<DetailPokemnonModel>(DetailPokemnonModel());

  DetailPokemnonModel get pokemon => pokemonNotifier.value;
  set pokemon(DetailPokemnonModel value) => pokemonNotifier.value = value;

  Future<void> getPokemon(String name) async {
    pokemon = await PokemonServices().searchPokemon(name);
    return;
  }
}
