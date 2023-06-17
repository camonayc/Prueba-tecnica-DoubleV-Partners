import '../models/user_model.dart';

abstract class UserRepository {
  Future<bool> createUser({required UserModel user});
  Future<List<UserModel>> readUsers();
  Future<Map<bool, UserModel?>> updateUser({required UserModel user});
  Future<bool> deleteUser({required String userId});
}
