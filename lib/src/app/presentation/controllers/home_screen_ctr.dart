import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/register_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/users_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/users/users_screen.dart';

import '../views/register/register_screen.dart';

/// Controlador de la pantalla de inicio.
///
/// @author: Camilo Gómez.
class HomeScreenController extends GetxController {
  static HomeScreenController initializeController() {
    try {
      HomeScreenController controller = Get.find<HomeScreenController>();
      return controller;
    } catch (e) {
      HomeScreenController controller = Get.put(HomeScreenController());
      return controller;
    }
  }

  final RegisterScreenController registerController =
      RegisterScreenController.initializeController();

  final UsersScreenController usersController =
      UsersScreenController.initializeController();

  /// Función para navegar a la pantalla de usuarios.
  ///
  /// @author: Camilo Gómez.
  void goToUsersScreen() {
    Get.offAllNamed(UsersScreen.routeName);
  }

  /// Función para navegar a la pantalla de registrar usuario.
  ///
  /// @author: Camilo Gómez.
  void goToRegisterScreen() {
    Get.toNamed(RegisterScreen.routeName);
  }
}
