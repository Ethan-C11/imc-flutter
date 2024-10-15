

import 'package:flutter_test/flutter_test.dart';
import 'package:imc/body_mass_index.dart';
import 'package:imc/enum_imc_type.dart';

void main() {
  test('Test du calcul de l\'IMC le résultat devrait être 100', () async {
    final imc = BodyMassIndex.calculerIMC(100, 100);

    expect(imc, 100);
  });

  test('Test retour de la catégorie, le résultat devrait être normal', () async {
    final imcType = BodyMassIndex.getImcType(24);

    expect(imcType, EnumImcType.normal);
  });
}
