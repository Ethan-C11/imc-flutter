import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './body_mass_index.dart';
import './enum_type_input.dart';


class textInput extends StatelessWidget {
  late EnumTypeInput _inputType;
  late String _inputName;
  late BodyMassIndexState _parent;

  textInput(EnumTypeInput inputType, BodyMassIndexState parent) {
    _inputType = inputType;
    _parent = parent;

    if(inputType == EnumTypeInput.taille) {
      _inputName = "Taille (cm)";
    } else if (inputType == EnumTypeInput.poids) {
      _inputName = "Poids (kg)";
    }
  }

   _submitInput(String value, BuildContext context) async {
      int number = 1;
      if (int.tryParse(value) == null ||
          int.tryParse(value) == 0) {
        value = '1';
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Valeur incorrecte'),
                content: const Text(
                    'La valeur d\'incrémentation ne peut pas être nulle, celle-ci sera définie à 1'),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'))
                ],
              );
            });
      } else {
        number = int.parse(value);
        if(_inputType == EnumTypeInput.taille) {
          this._parent.imcSetTaille(number);
        } else if (_inputType == EnumTypeInput.poids) {
          this._parent.imcSetPoids(number);
        }
      }

  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: _inputName),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onSubmitted: (String value) => _submitInput(value, context)
      ),
    );
  }

}


