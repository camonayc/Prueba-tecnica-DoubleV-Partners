import 'package:flutter/material.dart';

/// Campo utilizado para los formularios de las direcciones, solicita el tamaño de la pantalla y un titulo como parametros.
///
/// @author: Camilo Gómez.
class FieldForAddresForm extends StatelessWidget {
  const FieldForAddresForm({
    super.key,
    required this.size,
    required this.title,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.state,
    this.textEditingController,
  });

  final Size size;
  final String title;
  final Function(dynamic value)? onChanged;
  final Function(dynamic value)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool? state;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.01),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: TextFormField(
        readOnly: state ?? false,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(fontSize: size.height * 0.02),
            contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.7, color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.7, color: Colors.black))),
        focusNode: focusNode,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}
