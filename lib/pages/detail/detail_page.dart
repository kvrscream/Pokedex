import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokedesk/components/details/details_pokemon_widget.dart';
import 'package:pokedesk/models/detail_pokemon_model.dart';
import 'package:pokedesk/pages/detail/detail_controller.dart';
import 'package:pokedesk/themes/app_colors.dart';

class DetailPage extends StatefulWidget {
  final String? name;
  const DetailPage({Key? key, required this.name}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailController controller = DetailController();

  @override
  void initState() {
    controller.getPokemon(widget.name!);
    super.initState();
  }

  @override
  void dispose() {
    controller.pokemonNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name!),
        ),
        body: ValueListenableBuilder<DetailPokemnonModel>(
          valueListenable: controller.pokemonNotifier,
          builder: (_, pokemon, __) {
            if (pokemon.id != null) {
              return DetailPokemonWidet(id: pokemon.id!, name: pokemon.name!);
            } else {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              );
            }
          },
        ));
  }
}
