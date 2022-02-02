import 'package:flutter/material.dart';

class LoadingPokemonImageCard extends StatelessWidget {
  final String urlImage;
  const LoadingPokemonImageCard({Key? key, required this.urlImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlImage,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : CircularProgressIndicator(
                color: Colors.red[600],
                strokeWidth: 10,
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
