import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './enum_type_input.dart';

class textInput extends StatelessWidget {
  late String _inputName;
  late Function _setter;

  textInput(EnumTypeInput inputType, Function setter) {
    _setter = setter;

    if (inputType == EnumTypeInput.taille) {
      _inputName = "Taille (cm)";
    } else if (inputType == EnumTypeInput.poids) {
      _inputName = "Poids (kg)";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
          decoration: InputDecoration(
              border: const OutlineInputBorder(), labelText: _inputName),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3)
          ],
          onChanged: (String value) => _setter(int.parse(value)),
    ));
  }
}
