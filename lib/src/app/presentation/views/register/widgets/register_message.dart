import 'package:flutter/material.dart';

import '../../../../utils/constants/app_strings.dart';

/// Mensaje que se muestra en la parte inferior de la pantalla de registro cuando el usuario no ha completado todos los campos.
///
/// @author: Camilo Gómez.
class RegisterMessage extends StatelessWidget {
  const RegisterMessage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.finalTextPage,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: size.height * 0.018),
    );
  }
}
