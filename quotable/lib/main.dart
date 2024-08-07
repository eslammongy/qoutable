import 'package:flutter/material.dart';
import 'package:quotable/features/home/home_screen.dart';

void main() {
  runApp(const Quotable());
}

class Quotable extends StatelessWidget {
  const Quotable({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotable',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
