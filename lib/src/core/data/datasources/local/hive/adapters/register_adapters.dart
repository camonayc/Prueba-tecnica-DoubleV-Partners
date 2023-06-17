import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/data/datasources/local/hive/adapters/address_adapter.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/data/datasources/local/hive/adapters/user_adapter.dart';

class RegisterAdapters {
  static Future<void> registerAdapters() async {
    Hive
      ..registerAdapter(UserAdapter())
      ..registerAdapter(AddressAdapter());
  }
}
