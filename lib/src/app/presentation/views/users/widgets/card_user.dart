import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../widgets/custom_text_button.dart';
import '../../../widgets/user_pic.dart';

/// Widget que construye la tarjeta de usuario, donde se muestra el nombre, la fecha de naciomiento y un boton para acceder a la pantalla de ver las direcciones del usuario.
///
/// @author: Camilo Gómez.
class CardUser extends StatelessWidget {
  const CardUser({
    super.key,
    required this.size,
    required this.user,
    this.onPressed,
    required this.isSelect,
    required this.viewDetailsFunction,
    required this.textColor,
    required this.buttonTextColor,
  });

  final Size size;
  final UserModel user;
  final Color textColor;
  final Color buttonTextColor;
  final Function()? onPressed;
  final Function() viewDetailsFunction;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => EdgeInsets.only(left: size.width * 0.04)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color: !isSelect
                        ? AppAssets.cardIsNotSelect
                        : AppAssets.cardSelect),
                borderRadius: BorderRadius.circular(20))),
          ),
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  UserPic(
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    imageNet: false,
                    imagePath: AppAssets.userIcon,
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.02, left: size.width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                                fontSize: size.height * 0.022,
                                color: textColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: size.height * 0.01,
                            ),
                            child: Text(
                              user.birthDate,
                              style: TextStyle(
                                  fontSize: size.height * 0.022,
                                  color: textColor),
                            ),
                          ),
                          CustomTextButton(
                            size: size,
                            titleButton: AppStrings.viewAddress,
                            fontSizeTitle: size.height * 0.02,
                            colorTitle: buttonTextColor,
                            onPressed: viewDetailsFunction,
                          )
                        ],
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
