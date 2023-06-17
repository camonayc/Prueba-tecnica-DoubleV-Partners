import 'package:flutter/material.dart';

/// Widget que muestra un cargando tiene como parametro el tamaño de la pantall.
///
/// @author: Camilo Gómez.
class LoadingPage extends StatelessWidget {
  const LoadingPage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: size.height * 0.25),
        alignment: Alignment.topCenter,
        child: const CircularProgressIndicator(
          color: Colors.deepPurple,
        ));
  }
}
