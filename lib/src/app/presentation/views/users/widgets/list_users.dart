import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/users_screen_ctr.dart';

import 'card_user.dart';

/// Widget que  muestra la lista de tarjetas de usuarios construida por la funcioj buildListUserCard.
///
/// @author: Camilo Gómez.
class ListUsers extends StatelessWidget {
  const ListUsers({
    super.key,
    required this.size,
    required this.controller,
    required this.textColor,
    required this.buttonTextColor,
  });

  final Size size;
  final UsersScreenController controller;
  final Color textColor;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ObxValue(
            (value) => Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.02,
                        ),
                        padding: EdgeInsets.only(bottom: size.height * 0.02),
                        child: Text(
                          "Selecciona para añadir el usuario a la papelera, puedes deshacer las selecciones presionando la X, o eliminar presionando la papelera.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: size.height * 0.018),
                        )),
                    ...buildListUserCards(
                        size: size,
                        controller: controller,
                        textColor: textColor,
                        buttonTextColor: buttonTextColor)
                  ],
                ),
            controller.usersToDelete));
  }
}

/// Funcion que construye una lista de tarjetas de usuario dependiendo del numero de usuarios en la lista ingresada.
///
/// @author: Camilo Gómez.
List<Widget> buildListUserCards(
    {required Size size,
    required UsersScreenController controller,
    required Color textColor,
    required Color buttonTextColor}) {
  final List<Widget> widgets = [];
  for (var index = 0; index < controller.users.length; index++) {
    widgets.add(
      CardUser(
        size: size,
        user: controller.users[index],
        textColor: textColor,
        buttonTextColor: buttonTextColor,
        viewDetailsFunction: () =>
            controller.goToDetailsScreen(user: controller.users[index]),
        isSelect: controller.checkIfUserIsSelect(user: controller.users[index]),
        onPressed: controller.checkIfUserIsSelect(user: controller.users[index])
            ? () {
                controller.removeUserToDelete(user: controller.users[index]);
              }
            : () {
                controller.addUserToDelete(user: controller.users[index]);
              },
      ),
    );
  }
  return widgets;
}
