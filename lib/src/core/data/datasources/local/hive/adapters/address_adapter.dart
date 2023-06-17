import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';

class AddressAdapter extends TypeAdapter<AddressModel> {
  @override
  int get typeId => 1;

  @override
  AddressModel read(BinaryReader reader) {
    try {
      final numOfFields = reader.readByte();
      final fields = <int, dynamic>{
        for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()
      };
      return AddressModel(
          numAddress: fields[0],
          street: fields[1],
          numStreet: fields[2],
          city: fields[3],
          country: fields[4]);
    } catch (e) {
      throw UnimplementedError("Error read AddressAdapter: $e");
    }
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    try {
      writer
        ..writeByte(5)
        ..writeByte(0)
        ..write(obj.numAddress)
        ..writeByte(1)
        ..write(obj.street)
        ..writeByte(2)
        ..write(obj.numStreet)
        ..writeByte(3)
        ..write(obj.city)
        ..writeByte(4)
        ..write(obj.country);
    } catch (e) {
      throw UnimplementedError("Error write AddressAdapter: $e");
    }
  }
}
