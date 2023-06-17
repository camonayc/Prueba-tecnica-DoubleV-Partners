import 'package:prueba_tecnica_double_v_partners/src/core/data/datasources/local/hive/data/user_data_hive.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

abstract class UserDataRepository {
  final UserDataHive userData = UserDataHive();
  Future<bool> createUserData({required UserModel user});
  Future<List<UserModel>> getUsersData();
  Future<bool> deleteUserData({required String userId});
  Future<UserModel?> updateUserData({required UserModel user});
}
