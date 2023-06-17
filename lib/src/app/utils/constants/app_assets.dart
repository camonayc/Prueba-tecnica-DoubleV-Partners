import 'package:flutter/material.dart';

class AppAssets {
  static AppAssets? _singleton;
  factory AppAssets() => _singleton ??= AppAssets._();

  AppAssets._();

  // Colores tema app
  static Color deepPurple = Colors.deepPurple;
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color indigo = Colors.indigo;

  // Colores estado de tarjeta
  static Color cardSelect = Colors.red;
  static Color cardIsNotSelect = Colors.grey;

  // Icono de usuario
  static String userIcon = "assets/images/user_image.png";
}
