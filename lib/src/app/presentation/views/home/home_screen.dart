import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/config/controllers/theme_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/home_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/utils/constants/app_strings.dart';

import '../../widgets/custom_button.dart';
import 'widgets/select_app_color.dart';

/// Pantalla inicial de la aplicacion, la cual da pie para acceder a la pantalla de la lista de usuarios o a la pantalla para registrar un usuario.
///
/// @author: Camilo Gómez.
class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  HomeScreen({Key? key}) : super(key: key);

  final HomeScreenController controller =
      HomeScreenController.initializeController();

  final ThemeController themeController =
      ThemeController.initializeController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ObxValue(
        (appTheme) => GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                body: Center(
                  child: Container(
                    height: size.height,
                    width: size.width,
                    decoration:
                        BoxDecoration(gradient: appTheme.value.homeColors),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.2),
                          child: Text(
                            AppStrings.welcome,
                            style: TextStyle(
                                fontSize: size.height * 0.05,
                                color: Colors.black),
                          ),
                        ),
                        CustomButton(
                          size: size,
                          margin: EdgeInsets.only(top: size.height * 0.2),
                          title: AppStrings.users,
                          onPressed: () => controller.goToUsersScreen(),
                        ),
                        CustomButton(
                          size: size,
                          margin: EdgeInsets.only(top: size.height * 0.05),
                          title: AppStrings.registerButton,
                          onPressed: () => controller.goToRegisterScreen(),
                        )
                      ],
                    ),
                  ),
                ),
                floatingActionButton: SelectAppColor(
                    size: size, themeController: themeController),
              ),
            ),
        themeController.appTheme);
  }
}
