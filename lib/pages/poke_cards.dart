import 'package:flutter/material.dart';
import 'package:poke_api/widgets/pokemon_card.dart';

class PokeCardScreen extends StatelessWidget {
  const PokeCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Poke Cards')),
      ),
      body: const PokemonCards(),
    );
  }
}
