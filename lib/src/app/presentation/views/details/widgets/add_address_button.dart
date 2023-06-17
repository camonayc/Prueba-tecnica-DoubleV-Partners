import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/details_screen_ctr.dart';

/// Boton superior con icono de mas que despliega el dialogo con un formulario para agregar una nueva dirección al usuario.
///
/// @author: Camilo Gómez.
class AddAddressButton extends StatelessWidget {
  const AddAddressButton({
    super.key,
    required this.controller,
    required this.size,
    required this.buttonTextColor,
  });

  final DetailsScreenController controller;
  final Size size;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.addressToDelete.isEmpty
        ? IconButton(
            splashRadius: 1,
            onPressed: () => controller.buildNewAddressForm(
                size: size, buttonTextColors: buttonTextColor),
            icon: Icon(
              Icons.add,
              size: size.height * 0.04,
              color: Colors.black,
            ))
        : Container());
  }
}
