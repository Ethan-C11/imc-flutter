import 'package:flutter/material.dart';
import 'package:imc/text_input.dart';
import './enum_type_input.dart';
import './enum_imc_type.dart';
import './body_mass_index.dart';

class BmiForm extends StatefulWidget {
  const BmiForm({super.key, required this.title});

  final String title;

  @override
  State<BmiForm> createState() => BmiFormState();
}

class BmiFormState extends State<BmiForm> {
  int? _taille = 0;
  int? _poids = 0;
  double _imc = 0;
  late EnumImcType? _imcType;

  void setTaille(int taille) {
    setState(() {
      _taille = taille;
    });
  }
  void setPoids(int poids) {
    setState(() {
      _poids = poids;
    });
  }
  void setImc(double imc) {
    setState(() {
      _imc = imc;
    });
  }
  void setImcType(EnumImcType imcType){
    setState(() {
      _imcType = imcType;
    });
  }

  @override
  Widget build(BuildContext context) {

    void onButtonPress(int? poids, int? taille){
      double imc = BodyMassIndex.calculerIMC(poids, taille);
      if(imc == 0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Valeur incorrecte'),
                content:
                const Text('Veuillez remplir correctement les deux champs'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      }
      setImc(imc);
      setImcType(BodyMassIndex.getImcType(imc));
    }

    Widget cleanBuild() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textInput(EnumTypeInput.taille, setTaille)),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: textInput(EnumTypeInput.poids, setPoids))
            ]),          Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: ()=>onButtonPress(_poids, _taille),
                  child: const Text("Calculer votre IMC"),
                )),
            Builder(
              builder: (context) {
                if (_imc != 0) {
                  return Text('votre IMC est de ${_imc.toStringAsFixed(2)}.');
                }
                return const Text('');
              },
            ),
            Builder(
              builder: (context) {
                if (_imc != 0) {
                  switch(_imcType) {
                    case EnumImcType.underweight :
                      return const Text('Vous êtes en sous-poids');
                    case EnumImcType.normal:
                      return const Text('Vous êtes à un poids idéal');
                    case EnumImcType.overweight:
                      return const Text('Vous êtes en surpoids');
                    case EnumImcType.obesity:
                      return const Text('Vous êtes en obésité');
                    default :
                      return const Text('');
                  }
                }
                return const Text('');
              },
            ),
          ],
        ),
      );
    }


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(child: cleanBuild()));
  }
}
