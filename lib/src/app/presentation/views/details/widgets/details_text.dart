import 'package:flutter/material.dart';

/// Widget que retorna dos textos uno en negro y otro segun el tema de la app.
///
/// @author: Camilo Gómez.
class DetailsText extends StatelessWidget {
  const DetailsText({
    super.key,
    required this.size,
    required this.title,
    required this.dataTitle,
    required this.textColor,
  });

  final Size size;
  final String title;
  final String dataTitle;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(height: size.height * 0.002),
          Text(
            dataTitle,
            style: TextStyle(fontSize: size.height * 0.02, color: textColor),
          ),
        ],
      ),
    );
  }
}
