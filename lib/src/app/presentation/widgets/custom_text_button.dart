import 'package:flutter/material.dart';

/// Boton de texto customizado, pide el titulo como parametro y el tamaño de la letra.
///
/// @author: Camilo Gómez.
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.size,
    required this.titleButton,
    required this.fontSizeTitle,
    this.fontWeightTitle,
    this.onPressed,
    this.colorTitle,
  });

  final Size size;
  final String titleButton;
  final double fontSizeTitle;
  final Color? colorTitle;
  final FontWeight? fontWeightTitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.transparent)),
        onPressed: onPressed,
        child: Text(titleButton,
            style: TextStyle(
                color: colorTitle,
                fontWeight: fontWeightTitle,
                fontSize: fontSizeTitle)));
  }
}
