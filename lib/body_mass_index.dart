import './enum_imc_type.dart';

class BodyMassIndex {
  static double calculerIMC(int? _poids, int? _taille) {
    if (_poids == 0 || _taille == 0 || _poids == null || _taille == null) {
      return 0;
    } else {
      double tailleTemp = _taille / 100;
      double imc = _poids / (tailleTemp * tailleTemp);

      return imc;
    }
  }

  static EnumImcType getImcType(double imc) {
    late EnumImcType imcType;
    if (imc < 18.5) {
      imcType = EnumImcType.underweight;
    } else if (imc >= 18.5 && imc < 25) {
      imcType = EnumImcType.normal;
    } else if (imc >= 25 && imc < 30) {
      imcType = EnumImcType.overweight;
    } else {
      imcType = EnumImcType.obesity;
    }
    return imcType;
  }
}
