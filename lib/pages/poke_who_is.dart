import 'package:flutter/material.dart';
import 'package:poke_api/models/pokedex_model.dart';
import 'package:poke_api/provider/poke_api_provider.dart';
import 'package:poke_api/widgets/loading_pokemon.dart';
import 'package:poke_api/widgets/pokemon_options.dart';
import 'package:poke_api/widgets/utils.dart';
import 'package:provider/provider.dart';

class PokePage extends StatelessWidget {
  const PokePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokeApiProvider>(context, listen: false);
    final pokemon = (provider.listPokemon..shuffle()).first;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        provider.mostrarImagen = false;
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Who is this Pokémon?"),
          actions: [
            IconButton(
                onPressed: () {
                  print('Recargar pagina');
                  provider.mostrarImagen = false;
                  Navigator.pushReplacementNamed(context, 'whois');
                },
                icon: Icon(Icons.replay_outlined))
          ],
        ),
        body: WhoisPokemonWidget(pokemon: pokemon),
      ),
    );
  }
}

class WhoisPokemonWidget extends StatefulWidget {
  const WhoisPokemonWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokeDexModel pokemon;

  @override
  State<WhoisPokemonWidget> createState() => _WhoisPokemonWidgetState();
}

class _WhoisPokemonWidgetState extends State<WhoisPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FirstSection(
            pokemon: widget.pokemon,
          ),
          SecondSection(pokemon: widget.pokemon),
        ]));
  }
}

class SecondSection extends StatelessWidget {
  final PokeDexModel pokemon;
  const SecondSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokeApiProvider>(context, listen: false);
    List<PokeDexModel> listaPokemon = provider.listPokemon;
    List<PokeDexModel> listaPokemonRandom = PokemonUtils.getRandomPokemons(
        pokemonNumber: 5, pokemonList: listaPokemon, pokemonReal: pokemon);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Choose your answer!',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 30,
              //fontWeight: FontWeight.bold,
              fontFamily: 'PressStart2P',
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 10.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
        ButtonPokemonName(listRandomPokemon: listaPokemonRandom),
      ],
    );
  }
}

class FirstSection extends StatelessWidget {
  final PokeDexModel pokemon;
  const FirstSection({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: LoadingPokemonImage(
        urlImage: pokemon.urlOfficialArt(),
      ),
    );
  }
}
