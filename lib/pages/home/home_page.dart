import 'package:flutter/material.dart';
import 'package:pokedesk/models/pokemon_model.dart';
import 'package:pokedesk/pages/home/home_controller.dart';
import 'package:pokedesk/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
          backgroundColor: AppColors.primary,
        ),
        body: ValueListenableBuilder<List<PokemonModel>>(
          valueListenable: controller.pokemonsNotifier,
          builder: (_, pokemons, __) => ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(pokemons[index].name),
              );
            },
          ),
        ));
  }
}
