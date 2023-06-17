import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/details_screen_ctr.dart';

import '../../../../core/domain/models/user_model.dart';
import '../../../config/controllers/theme_ctr.dart';
import '../../../utils/constants/app_strings.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/delete_cancel_buttons.dart';
import 'widgets/add_address_button.dart';
import 'widgets/user_complete_address.dart';

/// Pagina para ver los detalles y las direcciones de un usuario.
///
/// @author: Camilo Gómez.
class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";
  DetailsScreen({Key? key}) : super(key: key);

  final DetailsScreenController controller =
      DetailsScreenController.initializeController();

  final ThemeController themeController =
      ThemeController.initializeController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ObxValue(
        (appTheme) => Scaffold(
            appBar: CustomAppBar(
              titleAppBar: AppStrings.detailsPageTitle,
              appBarColor: appTheme.value.primaryAppColor,
              fontSize: size.height * 0.03,
              titleColor: Colors.black,
              leadingWidget: CustomBackButton(
                  size: size, onPressed: controller.returnToUsersScreen),
              actionsAppBar: [
                AddAddressButton(
                  controller: controller,
                  size: size,
                  buttonTextColor: appTheme.value.secundaryTextColor,
                )
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ButtonsDeleteCancel(
              size: size,
              observable: controller.addressToDelete,
              cancelFunction: () => controller.cancelDelete(),
              deleteFunction: () async =>
                  await controller.deleteAddressSelect(),
            ),
            body: ObxValue((value) {
              final UserModel user = value.value;
              return Center(
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.all(20),
                  child: UserCompleteDetails(
                      size: size,
                      user: user,
                      controller: controller,
                      textAddresColor: appTheme.value.secundaryTextColor,
                      textDetailsColor: appTheme.value.secundaryTextColor),
                ),
              );
            }, controller.userDetails)),
        themeController.appTheme);
  }
}
