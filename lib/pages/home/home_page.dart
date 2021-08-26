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
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.nextPokemons();
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokédex"),
          backgroundColor: AppColors.primary,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/search");
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: ValueListenableBuilder<List<PokemonModel>>(
          valueListenable: controller.pokemonsNotifier,
          builder: (_, pokemons, __) => ListView.builder(
            controller: _scrollController,
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
