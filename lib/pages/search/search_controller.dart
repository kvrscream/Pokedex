import 'package:flutter/material.dart';
import 'package:pokedesk/models/detail_pokemon_model.dart';
import 'package:pokedesk/services/pokemon_services.dart';

class SearchController {
  final pokemonNotifier =
      ValueNotifier<DetailPokemnonModel>(DetailPokemnonModel());
  //Pega o valor do ValueNotifier
  DetailPokemnonModel get pokemon => pokemonNotifier.value;
  //Insere o valor no ValueNotifier
  set pokemon(DetailPokemnonModel value) => pokemonNotifier.value = value;

  String? validation;
  String? nameOrId;
  //OnChange para pegar valor preenchido no campo de busca
  void onChange(String value) {
    nameOrId = value;
  }

  Future<void> searchPokemon() async {
    if (nameOrId != null && nameOrId != "") {
      pokemon = await PokemonServices().searchPokemon(nameOrId!);
    } else {
      validation = "Você precisa inserir um nome em inglês ou o id do pokemon!";
    }
    return;
  }
}
