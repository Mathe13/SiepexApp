import 'package:flutter/material.dart';

class PercentageHelper {
  static howManyPercentHeight(double actualHeight, BuildContext context) {
    return ((actualHeight / MediaQuery.of(context).size.height)) * 100;
  }

  static howManyPercentWidth(double actualWidth, BuildContext context) {
    return ((actualWidth / MediaQuery.of(context).size.width)) * 100;
  }

  /// retorna o width baseado no tamanho da tela e a porcentagem informada
  static width(double percent, BuildContext context) {
    return ((MediaQuery.of(context).size.width) * (percent / 100));
  }

  /// retorna o heiht baseado no tamanho da tela e a porcentagem informada
  static height(double percent, BuildContext context) {
    return ((MediaQuery.of(context).size.height) * (percent / 100));
  }
}
