import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:themoviedb_app/app_module.dart';

void main() {
  runApp(
    ModularApp(module: AppModule(), child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
    );
  }
}
