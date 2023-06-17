import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/register_screen_ctr.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_button.dart';
import 'address_form.dart';
import 'birthdate_form.dart';
import 'field_for_form.dart';
import 'register_message.dart';

/// Formulario de registro de nuevo usuario, donde se pide el nombre, apellido, fecha de nacimiento y una dirección como minima para crear el nuevo usuario (se pueden agregar mas direcciones).
///
/// @author: Camilo Gómez.
class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.size,
    required this.controller,
    required this.textColor,
  });

  final Size size;
  final RegisterScreenController controller;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.02,
          bottom: size.height * 0.02,
          left: size.width * 0.1,
          right: size.width * 0.1),
      padding: EdgeInsets.only(left: size.width * 0.1, right: size.width * 0.1),
      child: Column(
        children: [
          FieldForForm(
            size: size,
            title: AppStrings.name,
            hitTitle: AppStrings.contextFieldUserName,
            focusNode: controller.userNameFocus,
            onChanged: (value) {
              controller.userName.value = value;
            },
            onFieldSubmitted: (value) {
              controller.userName.value = value;
              FocusScope.of(context).requestFocus(controller.userLastNameFocus);
            },
          ),
          FieldForForm(
            size: size,
            title: AppStrings.lastName,
            hitTitle: AppStrings.contextFieldUserLastName,
            focusNode: controller.userLastNameFocus,
            onChanged: (value) {
              controller.userLastName.value = value;
            },
            onFieldSubmitted: (value) {
              controller.userLastName.value = value;
            },
          ),
          BirthDateForm(size: size, controller: controller),
          ObxValue(
              (value) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.length,
                  itemBuilder: (context, index) => AddressForm(
                        size: size,
                        index: index,
                        controller: controller,
                      )),
              controller.userMapAddress),
          CustomTextButton(
              size: size,
              titleButton: AppStrings.addAddressTextButton,
              colorTitle: textColor,
              fontSizeTitle: size.height * 0.025,
              onPressed: () => controller.addAddressForm()),
          Obx(() => controller.checkFieldsAddress() &&
                  controller.userName.value != "" &&
                  controller.userLastName.value != "" &&
                  controller.checkBirthDateFields()
              ? CustomButton(
                  size: size,
                  title: AppStrings.completeButton,
                  onPressed: () async {
                    await controller.registerUser();
                  },
                )
              : RegisterMessage(size: size))
        ],
      ),
    );
  }
}
