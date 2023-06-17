import 'package:flutter/material.dart';
/// Función para obtener una lista de DropdownMenuItem para los dias.
///
/// @author: Camilo Gómez.
List<DropdownMenuItem<String>> getDays(Size size) {
  List<DropdownMenuItem<String>> days = [];
  days.clear();
  for (var i = 1; i < 32; i++) {
    days.add(DropdownMenuItem(
      alignment: Alignment.center,
      value: i <= 9 ? "0$i" : "$i",
      child: Text(i <= 9 ? "0$i" : "$i",
          style: TextStyle(fontSize: size.height * 0.018)),
    ));
  }
  return days;
}
