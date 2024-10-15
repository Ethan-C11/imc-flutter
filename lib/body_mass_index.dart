import 'package:flutter/material.dart';
import 'package:imc/text_input.dart';
import './enum_type_input.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({super.key, required this.title});

  final String title;

  @override
  State<BodyMassIndex> createState() => BodyMassIndexState();
}

class BodyMassIndexState extends State<BodyMassIndex> {
  int _taille = 0;
  int _poids = 0;
  double _imc = 0;

  void imcSetTaille(int taille) {
    setState(() {
      _taille = taille;
    });
  }

  void imcSetPoids(int poids) {
    setState(() {
      _poids = poids;
    });
  }

  void _calculerIMC() {
    double _tailleTemp = _taille / 100;
    setState(() {
      _imc = _poids / (_tailleTemp * _tailleTemp);
    });
  }

  Widget _cleanBuild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: textInput(EnumTypeInput.taille, this)),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: textInput(EnumTypeInput.poids, this))
          ]),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: _calculerIMC,
                child: const Text("Calculer votre IMC"),
              )),
          Text('votre IMC est de $_imc'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: _cleanBuild(context));
  }
}
