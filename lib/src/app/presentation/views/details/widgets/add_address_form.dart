import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/widgets/custom_button.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/widgets/custom_text_button.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/field_for_address_form.dart';

/// Formulario para agregar una nueva dirección desde la pantalla de direcciones del usuario.
///
/// @author: Camilo Gómez.
class AddAddressForm extends StatelessWidget {
  AddAddressForm({
    super.key,
    required this.size,
    required this.addButtonFunction,
    required this.streetCtr,
    required this.numStreetCtr,
    required this.cityCtr,
    required this.countryCtr,
    required this.cancelButtonFunction,
    required this.buttonTextColor,
  });

  final Size size;
  final Function() addButtonFunction;
  final Function() cancelButtonFunction;
  final TextEditingController streetCtr;
  final TextEditingController numStreetCtr;
  final TextEditingController cityCtr;
  final TextEditingController countryCtr;
  final Color buttonTextColor;

  final FocusNode streetFocus = FocusNode();
  final FocusNode numStreetFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode countryFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.01,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.street,
                  textEditingController: streetCtr,
                  focusNode: streetFocus,
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.numStreet,
                  focusNode: numStreetFocus,
                  textEditingController: numStreetCtr,
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.city,
                  focusNode: cityFocus,
                  textEditingController: cityCtr,
                ),
                FieldForAddresForm(
                  size: size,
                  title: AppStrings.country,
                  focusNode: countryFocus,
                  textEditingController: countryCtr,
                  onFieldSubmitted: (value) => addButtonFunction(),
                ),
                CustomButton(
                  size: size,
                  title: AppStrings.addAddressButton,
                  margin: EdgeInsets.only(
                      top: size.height * 0.04, bottom: size.height * 0.01),
                  onPressed: addButtonFunction,
                ),
                CustomTextButton(
                  size: size,
                  titleButton: AppStrings.cancel,
                  colorTitle: buttonTextColor,
                  fontSizeTitle: size.height * 0.02,
                  onPressed: cancelButtonFunction,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
