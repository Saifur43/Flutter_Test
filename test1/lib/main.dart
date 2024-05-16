import 'package:flutter/material.dart';
import 'package:test1/gradint_container.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 80, 8, 110),
          Color.fromARGB(0, 66, 9, 78),
        ),
      ),
    );
  }
}

