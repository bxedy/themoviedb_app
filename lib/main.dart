import 'package:flutter/material.dart';
import 'package:themoviedb_app/features/home/presentation/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const HomeScreen(),
    );
  }
}
