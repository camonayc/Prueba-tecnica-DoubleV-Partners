import 'package:flutter/material.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/details/details_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/home/home_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/register/register_screen.dart';
import 'package:prueba_tecnica_double_v_partners/src/app/presentation/views/users/users_screen.dart';

class AppRoutes {
  static PageRoute<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return _fadeRoute(HomeScreen(), settings);
      case RegisterScreen.routeName:
        return _fadeRoute(RegisterScreen(), settings);
      case UsersScreen.routeName:
        return _fadeRoute(UsersScreen(), settings);
      case DetailsScreen.routeName:
        return _fadeRoute(DetailsScreen(), settings);
      default:
        return _fadeRoute(HomeScreen(), settings);
    }
  }

  static PageRoute _fadeRoute(Widget view, RouteSettings settings) {
    return PageRouteBuilder(
        pageBuilder: (_, __, ___) => view,
        settings: settings,
        transitionDuration: const Duration(milliseconds: 350),
        transitionsBuilder: (_, animation, __, ___) => FadeTransition(
              opacity: animation,
              child: view,
            ));
  }
}
