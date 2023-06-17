import 'package:flutter/material.dart';

import '../../../../../core/domain/models/user_model.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_assets.dart';
import '../../../widgets/user_pic.dart';
import 'details_text.dart';

/// Widget que muestra el nombre, apellido, fecha de nacimiento y el icono de usuario.
///
/// @author: Camilo Gómez.
class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.size,
    required this.user,
    required this.textColor,
  });

  final Size size;
  final UserModel user;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserPic(
          height: size.width * 0.4,
          width: size.width * 0.4,
          imageNet: false,
          imagePath: AppAssets.userIcon,
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.02),
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailsText(
                size: size,
                title: AppStrings.userName,
                dataTitle: user.name,
                textColor: textColor,
              ),
              DetailsText(
                size: size,
                title: AppStrings.userLastName,
                dataTitle: user.lastName,
                textColor: textColor,
              ),
              DetailsText(
                size: size,
                title: AppStrings.userBirthDate,
                dataTitle: user.birthDate,
                textColor: textColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
