import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_api/models/pokedex_model.dart';

class PokemonUtils {
  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);

  List<int> generateRandomIntList(
      {required int length, required int min, required int max}) {
    final numbers = Set<int>();

    while (numbers.length < length) {
      final number = nextNumber(min: min, max: max);
      numbers.add(number);
    }

    return List.of(numbers);
  }

  static List<PokeDexModel> getRandomPokemons(
      {required int pokemonNumber,
      required List<PokeDexModel> pokemonList,
      required PokeDexModel pokemonReal}) {
    final pokemonRandom = Set<PokeDexModel>();
    pokemonReal.isPokemonReal = true;
    pokemonReal.isClicked = false;
    pokemonRandom.add(pokemonReal);
    while (pokemonRandom.length < pokemonNumber) {
      final pokemon = (pokemonList..shuffle()).first;
      pokemon.isClicked = false;
      pokemon.isPokemonReal = false;
      pokemonRandom.add(pokemon);
    }

    return List.of(pokemonRandom)..shuffle();
  }

  static Future<Image> getImage(String urlImage) async {
    return Image.network(
      urlImage,
      fit: BoxFit.contain,
    );
  }
}
