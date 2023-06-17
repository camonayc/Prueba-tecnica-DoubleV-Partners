import 'package:flutter/material.dart';

/// Widget Campo de texto que se utiliza en el formulario de registro de usuario.
///
/// @autor: Camilo Gómez.
class FieldForForm extends StatelessWidget {
  const FieldForForm({
    super.key,
    required this.size,
    required this.title,
    required this.hitTitle,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
  });

  final Size size;
  final String title;
  final String hitTitle;
  final Function(dynamic value)? onChanged;
  final Function(dynamic value)? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: size.height * 0.022),
        ),
        Container(
          padding: EdgeInsets.only(
              top: size.height * 0.01, bottom: size.height * 0.02),
          child: TextFormField(
            maxLines: 1,
            minLines: 1,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: hitTitle,
                hintStyle: TextStyle(fontSize: size.height * 0.02),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 0.7, color: Colors.black))),
            focusNode: focusNode,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
          ),
        )
      ],
    );
  }
}
