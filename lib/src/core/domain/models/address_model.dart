class AddressModel {
  int numAddress;
  String street;
  String numStreet;
  String city;
  String country;

  AddressModel(
      {required this.numAddress,
      required this.street,
      required this.numStreet,
      required this.city,
      required this.country});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
      numAddress: json['numAddress'],
      street: json['street'],
      numStreet: json['numStreet'],
      city: json['city'],
      country: json['country']);

  Map<String, dynamic> toJson() => {
        'numAddress': numAddress,
        'street': street,
        'numStreet': numStreet,
        'city': city,
        'country': country
      };

  AddressModel copyWith(
          {int? numAddress,
          String? street,
          String? numStreet,
          String? city,
          String? country}) =>
      AddressModel(
          numAddress: numAddress ?? this.numAddress,
          street: street ?? this.street,
          numStreet: numStreet ?? this.numStreet,
          city: city ?? this.city,
          country: country ?? this.country);
}
