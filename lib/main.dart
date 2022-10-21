import 'package:flutter/material.dart';
import 'package:parcial3flutter/paginas/home.dart';

void main() {
  runApp(const Bebidas());
}

class Bebidas extends StatelessWidget {
  const Bebidas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

