import 'package:flutter/material.dart';

import '../../../../utils/constants/app_strings.dart';

/// Texto que aparece cuando el usuario no tiene direcciones (solo es posible si se eliminan).
///
/// @author: Camilo Gómez.
class NoUserAddress extends StatelessWidget {
  const NoUserAddress({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      child: Text(
        AppStrings.noAddress,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: size.height * 0.022),
      ),
    );
  }
}
