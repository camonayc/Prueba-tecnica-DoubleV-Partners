import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Boton de cancelar para el formulario de agreagar nueva direccion en la pantalla de detalles del usuario.
///
/// @author: Camilo Gómez.
class ButtonsDeleteCancel extends StatelessWidget {
  const ButtonsDeleteCancel({
    super.key,
    required this.size,
    required this.observable,
    required this.deleteFunction,
    required this.cancelFunction,
  });

  final Size size;
  final RxList<dynamic> observable;
  final Function() deleteFunction;
  final Function() cancelFunction;

  @override
  Widget build(BuildContext context) {
    return ObxValue((value) {
      if (value.isNotEmpty) {
        return Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: deleteFunction,
                      splashRadius: 1,
                      icon: Icon(
                        Icons.delete,
                        size: size.height * 0.05,
                        color: Colors.deepPurple,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: Text(
                      "${value.length}",
                      style: TextStyle(
                        fontSize: size.height * 0.03,
                        color: Colors.deepPurple,
                      ),
                    ),
                  )
                ],
              ),
              IconButton(
                  onPressed: cancelFunction,
                  splashRadius: 1,
                  icon: Icon(
                    Icons.cancel,
                    size: size.height * 0.05,
                    color: Colors.deepPurple,
                  )),
            ],
          ),
        );
      } else {
        return Container();
      }
    }, observable);
  }
}
