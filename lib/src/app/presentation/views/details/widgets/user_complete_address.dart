import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/details_screen_ctr.dart';

import '../../../../../core/domain/models/user_model.dart';
import '../../../../utils/constants/app_strings.dart';
import 'list_address.dart';
import 'no_user_address.dart';
import 'user_details.dart';

/// Widget que muestra los detalles completos del usuario, tanto nombre, apellido, fecha de nacimiento, sus direcciones y el icono de usuario.
///
/// @author: Camilo Gómez.
class UserCompleteDetails extends StatelessWidget {
  const UserCompleteDetails({
    super.key,
    required this.size,
    required this.user,
    required this.controller,
    required this.textAddresColor,
    required this.textDetailsColor,
  });

  final Size size;
  final UserModel user;
  final DetailsScreenController controller;
  final Color textAddresColor;
  final Color textDetailsColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserDetails(size: size, user: user, textColor: textDetailsColor),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.02),
              child: Text(
                AppStrings.addressTitle,
                style: TextStyle(
                    color: textAddresColor,
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold),
              )),
          user.address.isNotEmpty
              ? ListAddress(
                  size: size,
                  textColor: textDetailsColor,
                  listAddress: user.address,
                  controller: controller,
                )
              : NoUserAddress(size: size)
        ],
      ),
    );
  }
}
