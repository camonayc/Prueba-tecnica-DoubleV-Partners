import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/utils/constants/app_assets.dart';

import '../../../../../core/domain/models/address_model.dart';
import '../../../../utils/constants/app_strings.dart';

/// Tarjeta que muestra los datos de una dirección del usuario, puede ser seleccionada para eliminarse.
///
/// @author: Camilo Gómez.
class CardAddress extends StatelessWidget {
  const CardAddress({
    super.key,
    required this.size,
    required this.address,
    required this.isSelect,
    required this.onPressed,
    required this.textColor,
  });

  final Size size;
  final AddressModel address;
  final bool isSelect;
  final Function() onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02,
              bottom: size.height * 0.01,
              left: size.width * 0.05),
          child: Text("#${address.numAddress}",
              style: TextStyle(
                  fontSize: size.height * 0.02, fontWeight: FontWeight.w500)),
        ),
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith((states) =>
                EdgeInsets.symmetric(vertical: size.height * 0.012)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color: !isSelect
                        ? AppAssets.cardIsNotSelect
                        : AppAssets.cardSelect),
                borderRadius: BorderRadius.circular(20))),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.addressCardAddress,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(padding: EdgeInsets.only(left: size.width * 0.01)),
                    Text(
                      "${address.street} #${address.numStreet}",
                      style: TextStyle(
                          fontSize: size.height * 0.022, color: textColor),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.005),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.addressCardCity,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(padding: EdgeInsets.only(left: size.width * 0.01)),
                    Text(
                      address.city,
                      style: TextStyle(
                          fontSize: size.height * 0.022, color: textColor),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.addressCardCountry,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(padding: EdgeInsets.only(left: size.width * 0.01)),
                  Text(
                    address.country,
                    style: TextStyle(
                        fontSize: size.height * 0.022, color: textColor),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
