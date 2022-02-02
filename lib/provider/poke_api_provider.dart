import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:poke_api/models/pokedex_model.dart';
import 'package:poke_api/models/pokemon_model.dart';

class PokeApiProvider extends ChangeNotifier {
  final String _baseUrl = 'pokeapi.co';
  final String _baseUrlPokeDex = 'raw.githubusercontent.com';
  bool _mostrarImagen = false;

  List<PokeDexModel> listPokemonCard = [];
  List<PokeDexModel> listPokemon = [];
  List<PokemonEntity> pokemonList = [];
  List<PokemonEntity> pokemonListCard = [];

  PokeApiProvider() {
    getPokeApiDataLocal();
  }

  getPokeApiDataLocal() async {
    print('Get PokeDex Api Data Local');
    final jsonData = await rootBundle.loadString('assets/json/pokedex.json');
    final list = json.decode(jsonData) as List<dynamic>;

    listPokemon = list.map((e) => PokeDexModel.fromJson(e)).toList();
    listPokemonCard = [...listPokemon];

    notifyListeners();
  }

  getPokeApiDataInternet() async {
    print('Get PokeDex Api Data');

    var url = Uri.https(
        _baseUrlPokeDex, 'Biuni/PokemonGO-Pokedex/master/pokedex.json');

    var response = await http.get(
      url,
    );

    print(response.body);
  }

  set mostrarImagen(bool mostrarImagen) {
    _mostrarImagen = mostrarImagen;
    notifyListeners();
  }

  resetImageStatus() {
    _mostrarImagen = false;
  }

  bool get mostrarImagen => _mostrarImagen;
}
