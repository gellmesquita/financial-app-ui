import 'package:flutter/material.dart';

import "package:flutter/material.dart";



void main(List<String> args) {
  runApp(const FinanciallApp());
}

class FinanciallApp extends StatelessWidget {
  const FinanciallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:MyApp()
    );
  }
}
 class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 35,
                    left: 340,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        width: 40,
                        height: 40,
                        color:const Color.fromRGBO(250, 250, 250, 0.1),
                        child: const Icon(
                          Icons.notification_add_outlined,
                          size: 24,
                          color: Color.fromRGBO(255, 255, 255, 1)
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:const [
                      Text(
                        "Ola Gelson Mesquita",
                        style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                      Text(
                        "Acesse aos seus dados disponiveis",
                        style:TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}