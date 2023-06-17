import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';

class UserModel {
  String idUSer;
  String name;
  String lastName;
  String birthDate;
  DateTime createDate;
  List<AddressModel> address;

  UserModel(
      {required this.idUSer,
      required this.name,
      required this.lastName,
      required this.birthDate,
      required this.createDate,
      required this.address});

  factory UserModel.fromJosn(Map<String, dynamic> json) => UserModel(
      idUSer: json['idUSer'],
      name: json['name'],
      lastName: json['lastName'],
      birthDate: json["birthDate"],
      createDate: DateTime.parse(json['createDate']),
      address: List<AddressModel>.from(
          json['address'].map((e) => AddressModel.fromJson(e))));

  Map<String, dynamic> toJson() => {
        'idUSer': idUSer,
        'name': name,
        'lastName': lastName,
        'birthDate': birthDate,
        'createDate': createDate.toIso8601String(),
        'address': List<dynamic>.from(address.map((e) => e.toJson()))
      };

  UserModel copyWith({
    required String idUSer,
    String? name,
    String? lastName,
    String? birthDate,
    DateTime? createDate,
    List<AddressModel>? address,
  }) =>
      UserModel(
          idUSer: idUSer,
          name: name ?? this.name,
          lastName: lastName ?? this.lastName,
          birthDate: birthDate ?? this.birthDate,
          createDate: createDate ?? this.createDate,
          address: address ?? this.address);
}
