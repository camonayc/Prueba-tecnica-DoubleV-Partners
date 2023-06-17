import 'package:flutter/material.dart';

import 'principal_theme.dart';

/// Tema color Rojo de la aplicación.
///
/// @author: Camilo Gómez.
class RedTheme implements PrincipalTheme {
  /// Color principal de la aplicación.
  @override
  MaterialColor primaryAppColor = Colors.red;

  /// Gradiente de colores de la pantalla de inicio.
  @override
  LinearGradient homeColors = LinearGradient(
      colors: [
        Colors.red[500]!,
        Colors.red[400]!,
        Colors.red[300]!,
        Colors.red[200]!,
        Colors.red[100]!,
        Colors.red[50]!
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.2, 0.35, 0.5, 0.65, 0.8, 1]);

  /// Color primario para textos.
  @override
  Color primaryTextColor = Colors.black;

  /// Color secundario para textos deriva del color principal de la aplicación.
  @override
  Color secundaryTextColor = Colors.red;

  /// Color para los textos en contenedores o campos de texto.
  @override
  Color hintTextColor = Colors.grey;

  /// Color para los bordes en la aplicación.
  @override
  Color bordersColor = Colors.grey;

  /// Color para el icono del usuario.
  @override
  Color userIconColor = Colors.grey;
}
