import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_tecnica_double_v_partners/src/core/data/datasources/local/hive/adapters/register_adapters.dart';

import 'src/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await RegisterAdapters.registerAdapters();
  runApp(const MyApp());
}
