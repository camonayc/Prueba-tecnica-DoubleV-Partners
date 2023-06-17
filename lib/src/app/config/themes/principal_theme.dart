import 'package:flutter/material.dart';

/// Tema principal de la aplicación.
///
/// @author: Camilo Gómez.
class PrincipalTheme {
  /// Color principal de la aplicación.
  final MaterialColor primaryAppColor = Colors.deepPurple;

  /// Gradiente de colores de la pantalla de inicio.
  final LinearGradient homeColors = LinearGradient(
      colors: [
        Colors.deepPurple[500]!,
        Colors.deepPurple[400]!,
        Colors.deepPurple[300]!,
        Colors.deepPurple[200]!,
        Colors.deepPurple[100]!,
        Colors.deepPurple[50]!
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.2, 0.35, 0.5, 0.65, 0.8, 1]);

  /// Color primario para textos.
  final Color primaryTextColor = Colors.black;

  /// Color secundario para textos deriva del color principal de la aplicación.
  final Color secundaryTextColor = Colors.deepPurple;

  /// Color para los textos en contenedores o campos de texto.
  final Color hintTextColor = Colors.grey;

  /// Color para los bordes en la aplicación.
  final Color bordersColor = Colors.grey;

  /// Color para el icono del usuario.
  final Color userIconColor = Colors.grey;
}
