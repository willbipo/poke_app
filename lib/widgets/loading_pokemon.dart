import 'package:flutter/material.dart';
import 'package:poke_api/provider/poke_api_provider.dart';
import 'package:provider/provider.dart';

class LoadingPokemonImage extends StatelessWidget {
  final String urlImage;
  const LoadingPokemonImage({Key? key, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokeApiProvider>(context, listen: true);
    //provider.resetImageStatus();
    return Image.network(
      urlImage,
      color: provider.mostrarImagen ? null : Colors.black,
      colorBlendMode: BlendMode.modulate,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : CircularProgressIndicator(
                color: Colors.red[600],
                strokeWidth: 30,
                backgroundColor: Colors.yellow,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
      },
    );
  }
}
