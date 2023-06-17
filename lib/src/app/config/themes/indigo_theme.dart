import 'package:flutter/material.dart';

import 'principal_theme.dart';

/// Tema color Indigo de la aplicación.
///
/// @author: Camilo Gómez.
class IndigoTheme implements PrincipalTheme {
  /// Color principal de la aplicación.
  @override
  MaterialColor primaryAppColor = Colors.indigo;

  /// Gradiente de colores de la pantalla de inicio.
  @override
  LinearGradient homeColors = LinearGradient(
      colors: [
        Colors.indigo[500]!,
        Colors.indigo[400]!,
        Colors.indigo[300]!,
        Colors.indigo[200]!,
        Colors.indigo[100]!,
        Colors.indigo[50]!
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.2, 0.35, 0.5, 0.65, 0.8, 1]);

  /// Color primario para textos.
  @override
  Color primaryTextColor = Colors.black;

  /// Color secundario para textos deriva del color principal de la aplicación.
  @override
  Color secundaryTextColor = Colors.indigo;

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
