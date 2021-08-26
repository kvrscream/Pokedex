import 'package:flutter/material.dart';
import 'package:pokedesk/themes/app_colors.dart';

class DetailPokemonWidet extends StatelessWidget {
  final int id;
  final String name;
  const DetailPokemonWidet({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Image.network(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/" +
                  this.id.toString() +
                  ".png",
            ),
          ),
        ),
        Text(
          this.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
