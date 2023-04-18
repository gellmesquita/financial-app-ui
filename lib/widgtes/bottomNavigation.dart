import 'package:flutter/material.dart';
import 'package:financialapp/screens/statistic.dart';
import 'package:financialapp/screens/home.dart';
import 'package:financialapp/screens/add.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexColor= 0;
  List mySCreens= const [Home(), Statistic(), Home(), Statistic()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: mySCreens[indexColor],
     floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Add())
        );
      },
      backgroundColor: const Color(0xff368983),
      child: const Icon(
        Icons.add,
        size: 20,
      ),
     ),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     bottomNavigationBar:  BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            GestureDetector(
              onTap: () {
                setState(() {
                  indexColor=0;
                });
              },
              child:  Icon(
                Icons.home,
                size:30,
                color: (indexColor==0) ?const Color(0xff368983): Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  indexColor=1;
                });
              },
              child:  Icon(
                Icons.bar_chart_outlined,
                size:30,
                color: (indexColor==1) ?const Color(0xff368983): Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  indexColor=2;
                });
              },
              child:  Icon(
                Icons.account_balance_wallet,
                size:30,
                color: (indexColor==2) ?const Color(0xff368983): Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  indexColor=3;
                });
              },
              child:  Icon(
                Icons.person,
                size:30,
                color: (indexColor==3) ?const Color(0xff368983): Colors.grey,
              ),
            ),
          ],
        ),
      ),
     ),
    );
  }
}