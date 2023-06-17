import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/register_screen_ctr.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/field_for_address_form.dart';

/// Widget que genera el formulario para agregar una nueva dirección, pidiendo la calle o carrera, el numero de la direccion (26-71), la ciudad y el pais.
///
/// @author: Camilo Gómez.
class AddressForm extends StatelessWidget {
  const AddressForm({
    super.key,
    required this.size,
    required this.index,
    required this.controller,
  });

  final Size size;
  final int index;
  final RegisterScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.012,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 0.7)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.03),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: size.width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        index == 0
                            ? AppStrings.address
                            : "${AppStrings.address}${index + 1}",
                        style: TextStyle(fontSize: size.height * 0.022),
                      ),
                      index == 0
                          ? Container()
                          : IconButton(
                              onPressed: () => controller.deleteAddressForm(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.red,
                              ))
                    ],
                  ),
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.street,
                  focusNode: controller.focusAddresForm[index + 1]
                      ?[AppStrings.streetFocus],
                  onChanged: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(street: value);
                  },
                  onFieldSubmitted: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(street: value);
                    FocusScope.of(context).requestFocus(
                        controller.focusAddresForm[index + 1]
                            ?[AppStrings.numStreetFocus]);
                  },
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.numStreet,
                  focusNode: controller.focusAddresForm[index + 1]
                      ?[AppStrings.numStreetFocus],
                  onChanged: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(numStreet: value);
                  },
                  onFieldSubmitted: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(numStreet: value);
                    FocusScope.of(context).requestFocus(controller
                        .focusAddresForm[index + 1]?[AppStrings.cityFocus]);
                  },
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.city,
                  focusNode: controller.focusAddresForm[index + 1]
                      ?[AppStrings.cityFocus],
                  onChanged: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(city: value);
                  },
                  onFieldSubmitted: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(city: value);
                    FocusScope.of(context).requestFocus(controller
                        .focusAddresForm[index + 1]?[AppStrings.countryFocus]);
                  },
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.country,
                  focusNode: controller.focusAddresForm[index + 1]
                      ?[AppStrings.countryFocus],
                  onChanged: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(country: value);
                  },
                  onFieldSubmitted: (value) {
                    controller.userMapAddress[index + 1] = controller
                        .userMapAddress[index + 1]!
                        .copyWith(country: value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
