import 'package:flutter/material.dart';

///Boton lista que se usa para año, mes y día en el formulario de registrar usuario.
///
///@autor: Camilo Gómez.
class DropDownYMD extends StatelessWidget {
  const DropDownYMD({
    super.key,
    required this.size,
    required this.title,
    required this.items,
    this.onChanged,
  });

  final Size size;
  final String title;
  final List<DropdownMenuItem<String>> items;
  final Function(dynamic v)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: size.height * 0.022)),
        Container(
          padding: EdgeInsets.only(top: size.height * 0.01),
          height: size.height * 0.07,
          width: size.width * 0.18,
          child: DropdownButtonFormField(
              value: "0",
              menuMaxHeight: size.height * 0.35,
              alignment: Alignment.center,
              isExpanded: true,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: size.height * 0.02, color: Colors.black),
                contentPadding: EdgeInsets.only(
                    left: size.width * 0.025, right: size.width * 0.01),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 0.7)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: Colors.black, width: 0.7)),
              ),
              items: [
                const DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: "0",
                  child: Text(
                    "- - -",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                ...items
              ],
              onChanged: onChanged),
        ),
      ],
    );
  }
}
