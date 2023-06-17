import 'package:flutter/material.dart';

/// Widget que muestra una imagen ya sea de la red o guardada en los assets de la aplicación.
///
/// @author: Camilo Gómez.
class UserPic extends StatelessWidget {
  const UserPic({
    super.key,
    required this.height,
    required this.width,
    required this.imageNet,
    required this.imagePath,
    this.margin,
  });

  final double height;
  final double width;
  final bool imageNet;
  final String imagePath;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: imageNet
          ? Image.network(imagePath)
          : Image.asset(imagePath, color: Colors.grey),
    );
  }
}
