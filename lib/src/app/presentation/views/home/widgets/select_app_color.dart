import 'package:flutter/material.dart';

import '../../../../config/controllers/theme_ctr.dart';
import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/constants/app_assets.dart';

/// Buton lista que permite seleccionar el tema de la aplicación.
///
/// @author: Camilo Gómez.
class SelectAppColor extends StatelessWidget {
  const SelectAppColor({
    super.key,
    required this.size,
    required this.themeController,
  });

  final Size size;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.15,
      height: size.width * 0.15,
      child: DropdownButtonFormField<String>(
          value: AppStrings.deepPurple,
          menuMaxHeight: size.height * 0.35,
          alignment: Alignment.center,
          isExpanded: true,
          decoration: InputDecoration(
            hintStyle:
                TextStyle(fontSize: size.height * 0.02, color: Colors.black),
            contentPadding: EdgeInsets.only(
                left: size.width * 0.025, right: size.width * 0.01),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.black, width: 0.7)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.black, width: 0.7)),
          ),
          items: [
            DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: AppStrings.deepPurple,
                child: Icon(
                  Icons.circle,
                  color: AppAssets.deepPurple,
                )),
            DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: AppStrings.red,
                child: Icon(
                  Icons.circle,
                  color: AppAssets.red,
                )),
            DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: AppStrings.green,
                child: Icon(Icons.circle, color: AppAssets.green)),
            DropdownMenuItem<String>(
                alignment: Alignment.center,
                value: AppStrings.indigo,
                child: Icon(
                  Icons.circle,
                  color: AppAssets.indigo,
                )),
          ],
          onChanged: (value) {
            themeController.changeTheme(themeSelect: value!);
          }),
    );
  }
}
