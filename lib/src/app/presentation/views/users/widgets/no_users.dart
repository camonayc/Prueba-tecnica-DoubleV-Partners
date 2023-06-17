import 'package:flutter/material.dart';

import '../../../../utils/constants/app_strings.dart';

/// Widget que muestra un texto indicando que no hay usuarios registrados en la aplicación.
class NoUsers extends StatelessWidget {
  const NoUsers({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.25),
      alignment: Alignment.topCenter,
      child: Text(
        AppStrings.noUser,
        style: TextStyle(fontSize: size.height * 0.025),
      ),
    );
  }
}
