import 'package:flutter/material.dart';

/// Función para obtener una lista de DropdownMenuItem para los años desde 1963 hasta 2023.
///
/// @author: Camilo Gómez.
List<DropdownMenuItem<String>> getYears(Size size) {
  List<DropdownMenuItem<String>> years = [];
  years.clear();
  for (var i = 1; i < 60; i++) {
    years.add(DropdownMenuItem(
      alignment: Alignment.center,
      value: "${2024 - i}",
      child:
          Text("${2024 - i}", style: TextStyle(fontSize: size.height * 0.018)),
    ));
  }
  return years;
}
