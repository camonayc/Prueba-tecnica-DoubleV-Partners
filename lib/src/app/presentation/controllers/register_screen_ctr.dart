import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/users_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/utils/extensions/functions/id_generator.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/user_model.dart';

import '../../utils/constants/app_strings.dart';
import '../views/users/users_screen.dart';
import 'user_data_ctr.dart';

/// Controlador de la pantalla de registrar usuario.
///
/// @author: Camilo Gómez.
class RegisterScreenController extends GetxController {
  static RegisterScreenController initializeController() {
    try {
      RegisterScreenController controller =
          Get.find<RegisterScreenController>();
      return controller;
    } catch (e) {
      RegisterScreenController controller = Get.put(RegisterScreenController());
      return controller;
    }
  }

  final UserDataContoller dataContoller =
      UserDataContoller.initializeController();

  final UsersScreenController usersController =
      UsersScreenController.initializeController();

  /// Foco del campo para el nombre del usuario.
  FocusNode userNameFocus = FocusNode();

  /// Foco del campo para el apellido del usuario.
  FocusNode userLastNameFocus = FocusNode();

  /// Variable reactiva para guardar el nombre del usuario.
  RxString userName = "".obs;

  /// Variable reactiva para guardar el apellido del usuario.
  RxString userLastName = "".obs;

  /// Variable reactiva para guardar el año de la fecha de cumpleaños.
  RxString year = "".obs;

  /// Variable reactiva para guardar el mes de la fecha de cumpleaños.
  RxString month = "".obs;

  /// Variable reactiva para guardar el día de la fecha de cumpleaños.
  RxString day = "".obs;

  /// Variable reactiva para el numero de formularios, siempre manteniendo 1.
  RxInt numAddress = 1.obs;

  /// Mapa reactivo que vincula funciones FocusNode a cada campo de cada formulario de dirección.
  RxMap<int, Map<String, FocusNode>> focusAddresForm = {
    1: {
      "userNameFocus": FocusNode(),
      "userLastNameFocus": FocusNode(),
      "streetFocus": FocusNode(),
      "numStreetFocus": FocusNode(),
      "cityFocus": FocusNode(),
      "countryFocus": FocusNode()
    }
  }.obs;

  /// Mapa reactivo que guarda dirección por formulario de dirección.
  RxMap<int, AddressModel> userMapAddress = {
    1: AddressModel(
        numAddress: 1, street: "", numStreet: "", city: "", country: "")
  }.obs;

  /// Lista reactiva para guardar las direcciones nuevas.
  RxList<AddressModel> addressCompleted = <AddressModel>[].obs;

  /// Función que agrega un nuevo formulario de dirección.
  ///
  /// @author: Camilo Gómez.
  void addAddressForm() {
    numAddress.value = numAddress.value + 1;
    userMapAddress.addAll({
      userMapAddress.length + 1: AddressModel(
          numAddress: numAddress.value,
          street: "",
          numStreet: "",
          city: "",
          country: "")
    });
    focusAddresForm.addAll({
      numAddress.value: {
        "streetFocus": FocusNode(),
        "numStreetFocus": FocusNode(),
        "cityFocus": FocusNode(),
        "countryFocus": FocusNode()
      }
    });
  }

  /// Función elimina el formulario de direccion seleccionado (siempre debe quedar uno).
  ///
  /// @author: Camilo Gómez.
  void deleteAddressForm() {
    focusAddresForm.remove(numAddress.value);
    userMapAddress.remove(numAddress.value);
    numAddress.value = numAddress.value - 1;
  }

  /// Función que verifica si los campos del formulario de dirección estan completos.
  ///
  /// @author: Camilo Gómez.
  bool checkFieldsAddress() {
    final check = userMapAddress.values
        .where((element) =>
            element.city != "" &&
            element.country != "" &&
            element.numStreet != "" &&
            element.country != "")
        .toList();
    if (check.length == userMapAddress.length) {
      return true;
    }
    return false;
  }

  /// Función para verificar que los campos de la fecha de cumpleaños esten diligenciados.
  ///
  /// @author: Camilo Gómez.
  bool checkBirthDateFields() {
    if (year.value != "" && month.value != "" && day.value != "") {
      return true;
    }
    return false;
  }

  /// Función que guarda las direcciones registradas.
  ///
  /// @author: Camilo Gómez.
  Future<void> saveAddresCompleted() async {
    final List<AddressModel> address = userMapAddress.values
        .where((element) =>
            element.city != "" &&
            element.country != "" &&
            element.numStreet != "" &&
            element.country != "")
        .toList();
    if (address.isNotEmpty) {
      addressCompleted.value = address;
    } else {
      addressCompleted.value = [];
    }
  }

  /// Función para registrar un nuevo usuario.
  ///
  /// @author: Camilo Gómez.
  Future<void> registerUser() async {
    try {
      final String newUserId = idGenerator();
      await saveAddresCompleted();
      final UserModel newUser = UserModel(
          idUSer: newUserId,
          name: userName.value,
          lastName: userLastName.value,
          birthDate: "${year.value}-${month.value}-${day.value}",
          createDate: DateTime.now(),
          address: addressCompleted);
      final bool isCreated = await dataContoller.createUserData(user: newUser);
      if (isCreated) {
        goToUsersScreen();
        await Get.defaultDialog(
            title: AppStrings.registerUserDialogTitle,
            middleText: AppStrings.erroRegisterUserDialogContent);
        return;
      } else {
        await Get.defaultDialog(
            title: AppStrings.erroRegisterUserDialogTitle,
            middleText: AppStrings.erroRegisterUserDialogContent);
        return;
      }
    } catch (e) {
      log("Error saveUser in RegisterScreenController: $e");
      await Get.defaultDialog(
          title: AppStrings.erroRegisterUserDialogTitle,
          middleText: AppStrings.erroRegisterUserDialogContent);
      return;
    }
  }

  /// Función para navegar a la pantalla de usuarios.
  ///
  /// @author: Camilo Gómez.
  void goToUsersScreen() async {
    Get.toNamed(UsersScreen.routeName);
  }

  /// Función para limpiar los campos del formulario para registrar usuario.
  ///
  /// @author: Camilo Gómez.
  void clean() {
    numAddress.value = 1;
    userMapAddress.value = {
      1: AddressModel(
          numAddress: 1, street: "", numStreet: "", city: "", country: "")
    };
  }
}
