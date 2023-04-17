import 'package:flutter/material.dart';
import 'package:financialapp/widgtes/chart.dart';
import 'package:financialapp/data/top.dart';

class Statistic extends StatefulWidget {
  const Statistic({super.key});

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  List day=["Dia", "Semana", "Mês", "Ano"];
  int index_color=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Dados Estatisticos",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5
                  ),
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        4,
                        (index) {
                          return 
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  index_color=index;
                                });
                              },
                              child:Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:(index==index_color)? const Color.fromARGB(255, 47, 125, 121):Colors.white
                              ),
                              alignment: Alignment.center,
                              child:  Text(
                                day[index],
                                style:  TextStyle(
                                  color:(index==index_color)?Colors.white: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                          ); 
                        }  
                      )      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration:  BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20)
                          )
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const[
                             Text(
                              "Despesas",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Chart(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Melhores Periodos",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(
                        Icons.swap_vert,
                        size: 25,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return  ListTile(
                  leading: Image.asset(
                    "images/${myData()[index].image}",
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    myData()[index].nome!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing:Text(
                    myData()[index].fee!,
                    style:  TextStyle(
                      fontSize: 16,
                      color: myData()[index].buy ? Colors.red: Colors.green,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    myData()[index].time!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    ),
                  ),
                );
              },
              childCount: myData().length
            ),

          )
        ],
       ),
      )
      
    
    );
  }
}