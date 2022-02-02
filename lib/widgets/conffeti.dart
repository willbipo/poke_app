import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConffetiWidget extends StatefulWidget {
  const ConffetiWidget({Key? key}) : super(key: key);

  @override
  _ConffetiWidgetState createState() => _ConffetiWidgetState();
}

class _ConffetiWidgetState extends State<ConffetiWidget> {
  var _controllerCenter;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _controllerCenter,
        blastDirectionality: BlastDirectionality
            .explosive, // don't specify a direction, blast randomly
        shouldLoop: true, // start again as soon as the animation is finished
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ], // manually specify the colors to be used
      ),
    );
  }
}
