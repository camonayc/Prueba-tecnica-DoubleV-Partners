import 'package:flutter/material.dart';

/// Boton para hacer back entre paginas, solicita la funcion de retorno como parametro.
///
/// @author: Camilo Gómez.
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.size,
    required this.onPressed,
  });

  final Size size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: size.height * 0.032,
        ),
        splashRadius: 1,
        onPressed: onPressed);
  }
}
