import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/theme.dart';

void main() {
  runApp(MaterialApp(theme: primaryTheme, home: const Home()));
}

//Class Sanbox untuk ngetest sebuah code aja.
class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sanbox'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('Sanboxxx'),
    );
  }
}
