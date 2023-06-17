import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/config/themes/indigo_theme.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/config/themes/green_theme.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/config/themes/red_theme.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/config/themes/principal_theme.dart';

/// Controlador para manejar los temas de la aplicacion.
///
/// @author: Camilo Gómez.
class ThemeController extends GetxController {
  static ThemeController initializeController() {
    try {
      ThemeController controller = Get.find<ThemeController>();
      return controller;
    } catch (e) {
      ThemeController controller = Get.put(ThemeController());
      return controller;
    }
  }

  /// Variable dinamica para guardar el tema seleccionado.
  Rx<PrincipalTheme> appTheme = PrincipalTheme().obs;

  /// Función que permite cambiar el tema de la aplicación segun lo seleccionado.
  ///
  /// @author: Camilo Gómez.
  void changeTheme({required String themeSelect}) {
    switch (themeSelect) {
      case "deepPurple":
        appTheme.value = PrincipalTheme();
        return;
      case "green":
        appTheme.value = GreenTheme();
        return;
      case "red":
        appTheme.value = RedTheme();
        return;
      case "indigo":
        appTheme.value = IndigoTheme();
        return;
      default:
        appTheme.value = PrincipalTheme();
        return;
    }
  }
}
