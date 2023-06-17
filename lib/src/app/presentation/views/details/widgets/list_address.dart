import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/details_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';

import 'card_address.dart';

/// Widget que retorna la lista de direcciones del usuario.
///
/// @author: Camilo Gómez.
class ListAddress extends StatelessWidget {
  const ListAddress({
    super.key,
    required this.size,
    required this.controller,
    required this.listAddress,
    required this.textColor,
  });

  final Size size;
  final List<AddressModel> listAddress;
  final DetailsScreenController controller;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listAddress.length,
        itemBuilder: (context, index) => ObxValue(
            (value) => CardAddress(
                  size: size,
                  textColor: textColor,
                  address: listAddress[index],
                  isSelect: value.contains(listAddress[index]),
                  onPressed: controller.checkIfAddressIsSelect(
                          address: listAddress[index])
                      ? () {
                          controller.removeAddressToDelete(
                              address: listAddress[index]);
                        }
                      : () {
                          controller.addAddresToDelete(
                              address: listAddress[index]);
                        },
                ),
            controller.addressToDelete));
  }
}
