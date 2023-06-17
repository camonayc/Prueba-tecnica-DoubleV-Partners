import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/home/home_screen.dart';

import 'config/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba tecnica DoubleV Partners',
      onGenerateRoute: AppRoutes.generateRoutes,
      home: HomeScreen(),
    );
  }
}
