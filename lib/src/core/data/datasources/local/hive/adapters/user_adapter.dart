import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  int get typeId => 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()
    };
    return UserModel(
        idUSer: fields[0],
        name: fields[1],
        lastName: fields[2],
        birthDate: fields[3],
        createDate: DateTime.parse(fields[4]),
        address: List<AddressModel>.from(fields[5].map((e) => e)));
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.idUSer)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.birthDate)
      ..writeByte(4)
      ..write(obj.createDate.toIso8601String())
      ..writeByte(5)
      ..write(obj.address);
  }
}
