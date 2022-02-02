import 'package:flutter/material.dart';
import 'package:poke_api/models/list_item.dart';
import 'package:poke_api/pages/pages.dart';

class AppRoutes {
  static const home = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (_) => const HomeScreen(),
    'cards': (_) => const PokeCardScreen(),
    'whois': (_) => const PokePage(),
    //'prueba': (_) => PruebaScreen(),
  };

  static List<ItemList> optionsList() {
    return [
      ItemList(
        icon: Icons.catching_pokemon,
        route: 'cards',
        text: 'Poke Cards',
        imageRoute: 'assets/images/pokecards.jpg',
      ),
      ItemList(
        icon: Icons.catching_pokemon_sharp,
        route: 'whois',
        text: 'Who is this Pokemon?',
        imageRoute: 'assets/images/who_pokemon.jpg',
      ),
      //ItemList(
      //    icon: Icons.catching_pokemon_sharp, route: 'prueba', text: 'Prueba'),
    ];
  }
}
