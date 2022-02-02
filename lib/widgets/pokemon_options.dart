import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:poke_api/models/pokedex_model.dart';
import 'package:poke_api/provider/poke_api_provider.dart';
import 'package:provider/provider.dart';

class ButtonPokemonName extends StatefulWidget {
  final List<PokeDexModel> listRandomPokemon;
  const ButtonPokemonName({Key? key, required this.listRandomPokemon})
      : super(key: key);

  @override
  State<ButtonPokemonName> createState() => _ButtonPokemonNameState();
}

class _ButtonPokemonNameState extends State<ButtonPokemonName> {
  late ConfettiController _controllerCenter;
  Color colorButton = Colors.red;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    print('Se ejecuta dispose');
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality
                .explosive, // don't specify a direction, blast randomly
            shouldLoop:
                true, // start again as soon as the animation is finished
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple
            ], // manually specify the colors to be used
          ),
        ),
        for (var item in widget.listRandomPokemon)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colorButton)),
                onPressed: !item.isClicked
                    ? () {
                        if (item.isPokemonReal) {
                          print('Pokemon Correcto :)');
                          colorButton = Colors.green;
                          Provider.of<PokeApiProvider>(context, listen: false)
                              .mostrarImagen = true;
                          _controllerCenter.play();

                          for (var item in widget.listRandomPokemon) {
                            if (!item.isPokemonReal) item.isClicked = true;
                          }
                          setState(() {});
                        } else {
                          setState(() {
                            item.isClicked = true;
                            print('Pokemon Incorrcto :(');
                          });
                        }
                      }
                    : null,
                child: Text(
                  '${item.name}',
                  //'nombre::${item.name}, clicked::${item.isClicked}, isReal::${item.isPokemonReal}',
                  style: TextStyle(fontSize: 25),
                )),
          ),
      ],
    );
  }
}
