import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        cardColor: Colors.red,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.brown,
        cardColor: Colors.black,
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
