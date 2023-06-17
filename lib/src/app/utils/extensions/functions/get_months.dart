import 'package:flutter/material.dart';
/// Función para obtener una lista de DropdownMenuItem para los meses.
///
/// @author: Camilo Gómez.
List<DropdownMenuItem<String>> getMonths(Size size) {
  List<DropdownMenuItem<String>> months = [];
  months.clear();
  for (var i = 1; i < 13; i++) {
    months.add(DropdownMenuItem(
      alignment: Alignment.center,
      value: i <= 9 ? "0$i" : "$i",
      child: Text(i <= 9 ? "0$i" : "$i",
          style: TextStyle(fontSize: size.height * 0.018)),
    ));
  }
  return months;
}