import 'package:flutter/material.dart';
import 'package:poke_api/widgets/utils.dart';

class PruebaScreen extends StatelessWidget {
  const PruebaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokemonUtils.getImage(
          'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(title: const Text('Algo')),
            body: Column(
              children: [
                Text('Hola a todos'),
              ],
            ),
          );
        }
        return Text('Algo');
      },
      initialData: Scaffold(
        appBar: AppBar(title: const Text('Algo')),
        body: Column(
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
