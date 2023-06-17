import 'package:flutter/material.dart';

/// Boton customizado curvo, pide el titulo como parametro.
///
/// @author: Camilo Gómez.
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.size,
    this.margin,
    required this.title,
    this.onPressed,
    this.textColor,
    this.borderColor,
  });

  final Size size;
  final String title;
  final Function()? onPressed;
  final EdgeInsets? margin;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin ?? EdgeInsets.only(top: size.height * 0.02),
        child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1, color: borderColor ?? Colors.black),
                    borderRadius: BorderRadius.circular(20))),
                fixedSize: MaterialStatePropertyAll(
                    Size(size.width * 0.45, size.height * 0.06))),
            child: Text(
              title,
              style: TextStyle(
                color: textColor ?? Colors.black,
                fontSize: size.height * 0.025,
              ),
            )));
  }
}
