import 'dart:developer';

import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/details_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/user_data_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/details/details_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

import '../../utils/constants/app_strings.dart';

/// Controlador de la pantalla de usuarios.
///
/// @author: Camilo Gómez.
class UsersScreenController extends GetxController {
  static UsersScreenController initializeController() {
    try {
      UsersScreenController controller = Get.find<UsersScreenController>();
      return controller;
    } catch (e) {
      UsersScreenController controller = Get.put(UsersScreenController());
      return controller;
    }
  }

  final UserDataContoller dataContoller =
      UserDataContoller.initializeController();

  final DetailsScreenController detailsController =
      DetailsScreenController.initializeController();

  /// Lista reactiva de UserModel para guardar los usarios obtenidos por loadUserData.
  RxList<UserModel> users = <UserModel>[].obs;

  /// Lista reactiva de UserModel que seran borrados de la base local de la aplicación.
  RxList<UserModel> usersToDelete = <UserModel>[].obs;

  /// Función para cargar usuarios al entrar a la pantalla de usuarios.
  ///
  /// @author: Camilo Gómez.
  Future<void> loadUserData() async {
    try {
      users.value = await dataContoller.getUsersData();
      orderUsers(users);
      await Future.delayed(const Duration(seconds: 1));
      return;
    } catch (e) {
      log("Error loadUserData in UsersScreenController: $e");
      await Get.defaultDialog(
          title: AppStrings.loadUserDialogTitle,
          middleText: AppStrings.loadUserDialogContent);
      return;
    }
  }

  /// Función para agregar un usuario a la lista de usuarios a eliminar.
  ///
  /// @author: Camilo Gómez.
  void addUserToDelete({required UserModel user}) {
    usersToDelete.add(user);
  }

  /// Función para remover un usuario de la lista de usuarios a eliminar.
  ///
  /// @author: Camilo Gómez.
  void removeUserToDelete({required UserModel user}) {
    usersToDelete.remove(user);
  }

  /// Función que verifica si el usuario esta en la lista de usuarios a eliminar.
  ///
  /// @author: Camilo Gómez.
  bool checkIfUserIsSelect({required UserModel user}) {
    return usersToDelete.contains(user);
  }

  /// Función que limpia la lista de usuarios a eliminar.
  ///
  /// @author: Camilo Gómez.
  void cancelDelete() {
    usersToDelete.clear();
  }

  /// Función que elimina los usuarios guardados en la lista de usuarios a elminar.
  ///
  /// @author: Camilo Gómez.
  Future<void> deleteUsersSelect() async {
    try {
      for (var e in usersToDelete) {
        await dataContoller.deleteUserData(userId: e.idUSer);
      }
      usersToDelete.clear();
      users.value = await dataContoller.getUsersData();
      orderUsers(users);
      await Future.delayed(const Duration(milliseconds: 50));
      await Get.defaultDialog(
          title: AppStrings.deleteUserDialogTitle,
          middleText: AppStrings.deleteUserDialogContent);
      return;
    } catch (e) {
      log("Error deleteUsersSelect in UsersScreenController: $e");
      await Get.defaultDialog(
          title: AppStrings.erroDeleteUserDialogTitle,
          middleText: AppStrings.deleteUserDialogContent);
      return;
    }
  }

  /// Función que ordena los usuarios por fecha de creacion, los mas recientes primero.
  ///
  /// @author: Camilo Gómez.
  orderUsers(List<UserModel> actividad) {
    actividad.sort((a, b) => "${b.createDate}".compareTo("${a.createDate}"));
  }

  /// Función para navegar a la pantalla de detalles.
  ///
  /// @author: Camilo Gómez.
  void goToDetailsScreen({required UserModel user}) {
    detailsController.userDetails.value = user;
    Get.toNamed(DetailsScreen.routeName);
  }
}
