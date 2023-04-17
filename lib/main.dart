import 'package:flutter/material.dart';
import 'package:financialapp/widgtes/chart.dart';
import 'package:financialapp/data/listData.dart';
import "package:financialapp/screens/statistic.dart";
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
 class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 350,
                child: _head(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const[
                    Text(
                      "Historico de transação",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                      ),
                    ),
                    Text(
                      "Ver todos",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) { 
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "images/${getList()[index].image}",
                      height: 40,
                    ),
                  ),
                  title: Text(
                    getList()[index].nome!,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle:  Text(
                    getList()[index].time!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  trailing: Text(
                    getList()[index].fee!,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: (getList()[index].buy) ? Colors.red: Colors.green
                    ),
                  ),
                );
                },
                childCount: getList().length
              ),
            )
          ],
        )
       
      ),
    );
  }

  Widget  _head() {
    return  Stack(
          children: [
           Column(
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
                      Padding(
                        padding: const EdgeInsets.only(
                          top:35,
                          left: 20
                        ),
                        child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children:const [
                          Text(
                            "Ola Gelson Mesquita",
                            style:TextStyle(
                              fontWeight: FontWeight.w800,
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
                      ),
                      )
                    ],
                  ),
                ),
              ],
            ),          
           Positioned(
            top: 160,
            left:37,
            child:  Container(
              height: 170,
              width: 330,
              decoration:  BoxDecoration(
                color:const Color.fromARGB(255, 47,125, 121),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const[
                  BoxShadow(
                    color: Color.fromRGBO(47, 125, 121, 0.3),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6
                  )
                ]
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Balanço total",
                          style:TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                        Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white ,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10
                        ),
                        child: Text(
                          "AOA 10.000",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 22
                          ),
                        ),
                      )     
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children:const [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Color.fromARGB(255, 85, 145, 141),
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Rendimento",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Row(
                          children:const [
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Color.fromARGB(255, 85, 145, 141),
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Saidas",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 5
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const[
                        Text(
                          "AOA 12300",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color:Colors.white
                          ),
                        ),
                        Text(
                          "AOA 12300",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color:Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
           )
          ],
        );
  }
}