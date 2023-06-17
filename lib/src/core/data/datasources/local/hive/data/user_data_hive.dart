import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/repositories/user_repository.dart';

class UserDataHive extends UserRepository {
  @override
  Future<bool> createUser({required UserModel user}) async {
    try {
      Box<UserModel> userBox = await Hive.openBox("User");
      final int numUsers = userBox.length;
      userBox.put(user.idUSer, user);
      if (userBox.length - numUsers == 1) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error createUser in UserDataHive: $e");
      return false;
    }
  }

  @override
  Future<bool> deleteUser({required String userId}) async {
    try {
      Box<UserModel> userBox = await Hive.openBox("User");
      final int numUsers = userBox.length;
      userBox.delete(userId);
      if (numUsers - userBox.length == 1) {
        return true;
      }
      return false;
    } catch (e) {
      log("Error deleteUser in UserDataHive: $e");
      return false;
    }
  }

  @override
  Future<List<UserModel>> readUsers() async {
    try {
      Box<UserModel> userBox = await Hive.openBox("User");
      if (userBox.isNotEmpty) {
        return userBox.values.toList();
      }
      return [];
    } catch (e) {
      log("Error readUsers in UserDataHive: $e");
      return [];
    }
  }

  @override
  Future<Map<bool, UserModel?>> updateUser({required UserModel user}) async {
    try {
      Box<UserModel> userBox = await Hive.openBox("User");
      final int numUsers = userBox.length;
      final String userId = user.idUSer;
      userBox.delete(userId);
      userBox.put(userId, user);
      if (userBox.length == numUsers) {
        return {true: userBox.get(userId)};
      }
      return {false: null};
    } catch (e) {
      log("Error updateUser in UserDataHive: $e");
      return {false: null};
    }
  }
}
