import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/user_data_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/users/users_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/domain/models/address_model.dart';

import '../../../core/domain/models/user_model.dart';
import '../../utils/constants/app_strings.dart';
import '../views/details/widgets/add_address_form.dart';

/// Controlador de la pantalla de detalles de usuario.
///
/// @author: Camilo Gómez.
class DetailsScreenController extends GetxController {
  static DetailsScreenController initializeController() {
    try {
      DetailsScreenController controller = Get.find<DetailsScreenController>();
      return controller;
    } catch (e) {
      DetailsScreenController controller = Get.put(DetailsScreenController());
      return controller;
    }
  }

  final UserDataContoller dataContoller =
      UserDataContoller.initializeController();

  /// Variable que guarda el usuario del que se debe mostrar los detalles.
  Rx<UserModel> userDetails = UserModel(
      idUSer: "",
      name: "",
      lastName: "",
      birthDate: "",
      createDate: DateTime(0),
      address: []).obs;

  /// Variable para guardar la nueva dirección que se crea.
  Rx<AddressModel> newAddress = AddressModel(
          numAddress: 0, street: "", numStreet: "", city: "", country: "")
      .obs;

  /// Lista reactiva para guardar direcciones para eliminar.
  RxList<AddressModel> addressToDelete = <AddressModel>[].obs;

  /// Lista reactiva para guardar las direcciones anteriores y las nuevas del usuario.
  RxList<AddressModel> newListAddress = <AddressModel>[].obs;

  final TextEditingController streetCtr = TextEditingController();
  final TextEditingController numStreetCtr = TextEditingController();
  final TextEditingController cityCtr = TextEditingController();
  final TextEditingController countryCtr = TextEditingController();

  /// Función que verifica si la dirección ya fue seleccionada.
  ///
  /// @author: Camilo Gómez.
  bool checkIfAddressIsSelect({required AddressModel address}) {
    return addressToDelete.contains(address);
  }

  /// Funcion que remueve todas las direcciones de la lista a eliminar.
  ///
  /// @author: Camilo Gómez.
  void cancelDelete() {
    addressToDelete.clear();
  }

  /// Función para agregar una direccion a la lista de direcciones a eliminar.
  ///
  /// @author: Camilo Gómez.
  void addAddresToDelete({required AddressModel address}) {
    addressToDelete.add(address);
  }

  /// Función para remover una direccion de la lista de direcciones a eliminar.
  ///
  /// @author: Camilo Gómez.
  void removeAddressToDelete({required AddressModel address}) {
    addressToDelete.remove(address);
  }

  /// Función para eliminar las direcciones seleccionadas por el usaurio.
  ///
  /// @author: Camilo Gómez.
  Future<void> deleteAddressSelect() async {
    try {
      createNewListAddress(addressToDelete: addressToDelete);
      final UserModel userAddressUpdate = userDetails.value
          .copyWith(idUSer: userDetails.value.idUSer, address: newListAddress);
      final UserModel? updateUser =
          await dataContoller.updateUserData(user: userAddressUpdate);
      if (updateUser != null) {
        userDetails.value = updateUser;
        await Get.defaultDialog(
            title: AppStrings.deleteAddressDialogTitle,
            middleText: AppStrings.deleteAddressDialogContent);
        addressToDelete.clear();
      } else {
        await Get.defaultDialog(
            title: AppStrings.errorDeleteAddressDialogTitle,
            middleText: AppStrings.errorDeleteAddressDialogContent);
        return;
      }
    } catch (e) {
      log("Error deleteAddressSelect in DetailsScreenController: $e");
      await Get.defaultDialog(
          title: AppStrings.errorDeleteAddressDialogTitle,
          middleText: AppStrings.errorDeleteAddressDialogContent);
      return;
    }
  }

  /// Funcion que crea una lista con las direcciones del usuario y la direccion nueva.
  ///
  /// @author: Camilo Gómez.
  void createNewListAddress({required List<AddressModel> addressToDelete}) {
    final List<AddressModel> actualAddress = userDetails.value.address;
    for (var e in addressToDelete) {
      actualAddress.remove(e);
    }
    newListAddress.value = actualAddress;
  }

  /// Función que verifica que todos los campos del formulario esten diligenciados.
  ///
  /// @author: Camilo Gómez.
  bool checkAllFileds() {
    if (streetCtr.text != "" &&
        numStreetCtr.text != "" &&
        cityCtr.text != "" &&
        countryCtr.text != "") {
      return true;
    } else {
      return false;
    }
  }

  /// Función que crea el modelo de direccion segun los datos en el formulario.
  ///
  /// @author: Camilo Gómez.
  void createNewAddress() {
    final int numAddressUser = userDetails.value.address.length + 1;
    newAddress.value = AddressModel(
        numAddress: numAddressUser,
        street: streetCtr.text,
        numStreet: numStreetCtr.text,
        city: cityCtr.text,
        country: countryCtr.text);
  }

  /// Funcion para guardar una nueva dirección.
  ///
  /// @author: Camilo Gómez.
  Future<void> saveNewAddress() async {
    if (checkAllFileds()) {
      try {
        createNewAddress();
        final UserModel userToUpdate = userDetails.value.copyWith(
            idUSer: userDetails.value.idUSer,
            address: userDetails.value.address + [newAddress.value]);
        final UserModel? updateUser =
            await dataContoller.updateUserData(user: userToUpdate);
        if (updateUser != null) {
          userDetails.value = updateUser;
          Get.back();
          await Get.defaultDialog(
              title: AppStrings.addNewAddressDialogTitle,
              middleText: AppStrings.addNewAddressDialogContent);
          return;
        } else {
          await Get.defaultDialog(
              title: AppStrings.errorAddNewAddressDialogTitle,
              middleText: AppStrings.errorAddNewAddressDialogContent);
          return;
        }
      } catch (e) {
        log("Error saveNewAddress in DetailsScreenController: $e");
        await Get.defaultDialog(
            title: AppStrings.errorAddNewAddressDialogTitle,
            middleText: AppStrings.errorAddNewAddressDialogContent);
        return;
      }
    } else {
      await Get.defaultDialog(
          title: AppStrings.missingFieldDialogTitle,
          middleText: AppStrings.missingFieldDialogcontent);
      return;
    }
  }

  /// Función que genera el dialogo con el formulario para agregar una nueva dirección.
  ///
  /// @author: Camilo Gómez.
  Future<void> buildNewAddressForm(
      {required Size size, required Color buttonTextColors}) async {
    clearFormFields();
    await Get.dialog(
      Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(50)),
        margin: EdgeInsets.symmetric(
            vertical: size.height * 0.2, horizontal: size.width * 0.15),
        child: Container(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                child: Text(
                  AppStrings.dialogTitle,
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
              ),
              AddAddressForm(
                size: size,
                streetCtr: streetCtr,
                numStreetCtr: numStreetCtr,
                cityCtr: cityCtr,
                countryCtr: countryCtr,
                buttonTextColor: buttonTextColors,
                addButtonFunction: () async => await saveNewAddress(),
                cancelButtonFunction: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Función de retorno a la pantalla de usuarios.
  ///
  /// @author: Camilo Gómez.
  void returnToUsersScreen() {
    Get.offAllNamed(UsersScreen.routeName);
  }

  /// Función para limpiar los campos del formulario de agregar direccion.
  ///
  /// @author: Camilo Gómez.
  void clearFormFields() {
    streetCtr.text = "";
    numStreetCtr.text = "";
    cityCtr.text = "";
    countryCtr.text = "";
  }
}
