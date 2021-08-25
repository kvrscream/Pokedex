import 'package:flutter/material.dart';
import 'package:pokedesk/pages/home/home_page.dart';
import 'package:pokedesk/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pokedex",
        theme: ThemeData(
            primaryColor: AppColors.primary, primarySwatch: Colors.red),
        initialRoute: "/home",
        routes: {"/home": (context) => HomePage()});
  }
}
