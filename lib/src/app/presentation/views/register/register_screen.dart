import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/controllers/theme_ctr.dart';
import '../../../utils/constants/app_strings.dart';
import '../../controllers/register_screen_ctr.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/register_form.dart';

/// Pagina para registrar un nuevo usuario en la aplicación.
///
/// @author: Camilo Gómez.
class RegisterScreen extends StatelessWidget {
  static const String routeName = "/register";
  RegisterScreen({Key? key}) : super(key: key);

  final RegisterScreenController controller =
      RegisterScreenController.initializeController();

  final ThemeController themeController =
      ThemeController.initializeController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ObxValue(
            (appTheme) => Scaffold(
                  appBar: CustomAppBar(
                    titleAppBar: AppStrings.titleRegisterPage,
                    appBarColor: appTheme.value.primaryAppColor,
                    fontSize: size.height * 0.03,
                    titleColor: Colors.black,
                    leadingWidget: CustomBackButton(
                      size: size,
                      onPressed: () {
                        Get.back();
                        controller.clean();
                      },
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterForm(
                          size: size,
                          controller: controller,
                          textColor: appTheme.value.secundaryTextColor,
                        )
                      ],
                    ),
                  ),
                ),
            themeController.appTheme));
  }
}
