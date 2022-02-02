import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:poke_api/models/pokedex_model.dart';
import 'package:poke_api/provider/poke_api_provider.dart';
import 'package:provider/provider.dart';

import 'loading_pokemon_card.dart';

class PokemonCards extends StatelessWidget {
  const PokemonCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeProvider = Provider.of<PokeApiProvider>(context, listen: false);
    final List<PokeDexModel> listaPokemons = pokeProvider.listPokemonCard;
    final size = MediaQuery.of(context).size;

    return Container(
      //padding: EdgeInsets.symmetric(vertical: ),
      margin: const EdgeInsets.symmetric(vertical: 50),
      height: size.height * .7,
      width: double.infinity,
      //decoration: const BoxDecoration(color: Colors.black12),
      child: Swiper(
        itemCount: listaPokemons.length,
        loop: true,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
        axisDirection: AxisDirection.left,
        //layout: SwiperLayout.STACK,
        //itemHeight: size.height * 0.2,
        //itemWidth: size.width * 0.2,
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (context, index) {
          final pokemon = listaPokemons[index];
          return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.4, 0.5, 0.6],
                      colors: [Colors.blue, Colors.yellow, Colors.red])),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PokemonNumber(pokemon: pokemon),
                  LoadingPokemonImageCard(urlImage: pokemon.urlOfficialArt()),
                  PokemonName(pokemon: pokemon),
                ],
              ));
        },
        //autoplay: true,
      ),
    );
  }
}

class PokemonName extends StatelessWidget {
  const PokemonName({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokeDexModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Text(
      pokemon.name!,
      //'#${pokemon.id} ${pokemon.name!}',
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 25,
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
    );
  }
}

class PokemonNumber extends StatelessWidget {
  const PokemonNumber({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokeDexModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${pokemon.id}',
      //'#${pokemon.id} ${pokemon.name!}',
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 50,
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
    );
  }
}
