import 'package:flutter/material.dart';

/// AppBar customizado para la aplicación.
///
/// @author: Camilo Gómez.
class CustomAppBar extends AppBar {
  final String titleAppBar;
  final Color appBarColor;
  final Widget? leadingWidget;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? titleColor;
  final List<Widget>? actionsAppBar;
  CustomAppBar(
      {Key? key,
      required this.titleAppBar,
      required this.appBarColor,
      this.leadingWidget,
      this.fontSize,
      this.fontWeight,
      this.titleColor,
      this.actionsAppBar})
      : super(
          key: key,
          centerTitle: true,
          elevation: 0,
          backgroundColor: appBarColor,
          leading: leadingWidget ?? Container(),
          actions: actionsAppBar,
          title: Text(
            titleAppBar,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: titleColor,
            ),
          ),
        );
}
