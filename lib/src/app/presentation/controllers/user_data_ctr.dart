import 'dart:developer';

import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/data/datasources/local/hive/data/user_data_hive.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/data/repositories/user_data_repository.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

/// Controlador para la obtencion de los datos de la base de datos Hive.
///
/// @author: Camilo Gómez.
class UserDataContoller extends GetxController implements UserDataRepository {
  static UserDataContoller initializeController() {
    try {
      UserDataContoller controller = Get.find<UserDataContoller>();
      return controller;
    } catch (e) {
      UserDataContoller controller = Get.put(UserDataContoller());
      return controller;
    }
  }

  /// Se hace uso de la clase donde se controla el CRUD del UserModel en Hive.
  @override
  UserDataHive get userData => UserDataHive();

  /// Función para crear un nuevo usuario en Hive.
  ///
  /// @author: Camilo Gómez.
  @override
  Future<bool> createUserData({required UserModel user}) async {
    try {
      final bool isCreateUser = await userData.createUser(user: user);
      return isCreateUser;
    } catch (e) {
      log("Error createUserData: $e");
      return false;
    }
  }

  /// Función para eliminar un usuario de Hive.
  ///
  /// @author: Camilo Gómez.
  @override
  Future<bool> deleteUserData({required String userId}) async {
    try {
      final bool isDeleteUser = await userData.deleteUser(userId: userId);
      return isDeleteUser;
    } catch (e) {
      log("Error deleteUserData: $e");
      return false;
    }
  }

  /// Función para obtener la lista de usuarios guardados en Hive.
  ///
  /// @author: Camilo Gómez.
  @override
  Future<List<UserModel>> getUsersData() async {
    try {
      final List<UserModel> data = await userData.readUsers();
      if (data.isNotEmpty) {
        return data;
      }
      return [];
    } catch (e) {
      log("Error getUsersData: $e");
      return [];
    }
  }

  /// Función para actualizar un usuario en Hive.
  ///
  /// @author: Camilo Gómez.
  @override
  Future<UserModel?> updateUserData({required UserModel user}) async {
    try {
      final Map<bool, UserModel?> isUpdatuser =
          await userData.updateUser(user: user);
      if (isUpdatuser.keys.first) {
        return isUpdatuser.values.first;
      }
      return null;
    } catch (e) {
      log("Error updateUserData: $e");
      return null;
    }
  }
}
