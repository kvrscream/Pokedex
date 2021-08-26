import 'package:flutter/material.dart';
import 'package:pokedesk/components/details/details_pokemon_widget.dart';
import 'package:pokedesk/models/detail_pokemon_model.dart';
import 'package:pokedesk/pages/search/search_controller.dart';
import 'package:pokedesk/themes/app_colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchController controller = SearchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Procurar Pokémon"),
          backgroundColor: AppColors.primary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextFormField(
                  validator: (value) => controller.validation,
                  initialValue: "",
                  onChanged: (value) {
                    controller.onChange(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Digite o nome do pokémon",
                    suffixIcon: IconButton(
                      onPressed: () async {
                        await controller.searchPokemon();
                        setState(() {});
                      },
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              ValueListenableBuilder<DetailPokemnonModel>(
                  valueListenable: controller.pokemonNotifier,
                  builder: (_, pokemon, __) {
                    if (pokemon.id != null) {
                      return DetailPokemonWidet(
                        id: pokemon.id!,
                        name: pokemon.name!,
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.secondary,
                          ),
                        ),
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
