import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/controllers/register_screen_ctr.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/register/widgets/drop_down_ymd.dart';

import '../../../../utils/constants/app_strings.dart';
import '../../../../utils/extensions/functions/get_days.dart';
import '../../../../utils/extensions/functions/get_months.dart';
import '../../../../utils/extensions/functions/get_years.dart';

/// Widget que muestra los tres botones lista de año, mes y día, para que el usuario escoja su fecha de nacimiento.
///
/// @author: Camilo Gómez.
class BirthDateForm extends StatelessWidget {
  const BirthDateForm({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final RegisterScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: size.height * 0.01),
          child: Text(
            AppStrings.birthDate,
            style: TextStyle(fontSize: size.height * 0.02),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDownYMD(
              size: size,
              title: AppStrings.year,
              items: getYears(size),
              onChanged: (value) {
                controller.year.value = value;
              },
            ),
            DropDownYMD(
              size: size,
              title: AppStrings.month,
              items: getMonths(size),
              onChanged: (value) {
                controller.month.value = value;
              },
            ),
            DropDownYMD(
              size: size,
              title: AppStrings.day,
              items: getDays(size),
              onChanged: (value) {
                controller.day.value = value;
              },
            ),
          ],
        ),
      ],
    );
  }
}
