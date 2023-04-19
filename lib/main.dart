import 'package:flutter/material.dart';
import 'package:financialapp/widgtes/bottomNavigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:financialapp/data/modal/addData.dart';

void main(List<String> args) async{
  
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