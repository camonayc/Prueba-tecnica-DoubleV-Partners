import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/users_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/home/home_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/widgets/custom_app_bar.dart';

import '../../../config/controllers/theme_ctr.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/back_button.dart';
import '../../widgets/delete_cancel_buttons.dart';
import '../../widgets/loading_page.dart';
import 'widgets/list_users.dart';
import 'widgets/no_users.dart';

/// Pantalla que muestra la lista de usuarios registrados en la aplicación.
///
/// @author: Camilo Gómez.
class UsersScreen extends StatelessWidget {
  static const String routeName = "/users";
  UsersScreen({Key? key}) : super(key: key);

  final UsersScreenController controller =
      UsersScreenController.initializeController();

  final ThemeController themeController =
      ThemeController.initializeController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.loadUserData();
    return ObxValue(
        (appTheme) => Scaffold(
            appBar: CustomAppBar(
              titleAppBar: AppStrings.users,
              appBarColor: appTheme.value.primaryAppColor,
              fontSize: size.height * 0.03,
              titleColor: Colors.black,
              leadingWidget: CustomBackButton(
                  size: size,
                  onPressed: () => Get.offAllNamed(HomeScreen.routeName)),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ButtonsDeleteCancel(
              size: size,
              observable: controller.usersToDelete,
              cancelFunction: () => controller.cancelDelete(),
              deleteFunction: () async => await controller.deleteUsersSelect(),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: FutureBuilder(
                future: controller.loadUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Obx(() => controller.users.isNotEmpty
                        ? ListUsers(
                            size: size,
                            controller: controller,
                            textColor: appTheme.value.primaryTextColor,
                            buttonTextColor: appTheme.value.secundaryTextColor,
                          )
                        : NoUsers(size: size));
                  }
                  return LoadingPage(size: size);
                },
              ),
            )),
        themeController.appTheme);
  }
}
