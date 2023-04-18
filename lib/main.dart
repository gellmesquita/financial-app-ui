import 'package:flutter/material.dart';
import 'package:financialapp/widgtes/bottomNavigation.dart';

void main(List<String> args) {
  runApp(const FinanciallApp());
}

class FinanciallApp extends StatelessWidget {
  const FinanciallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:BottomNav()
    );
  }
}