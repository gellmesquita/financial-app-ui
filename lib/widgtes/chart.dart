import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 350,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <SplineSeries<Vendas, String>>[
            SplineSeries<Vendas, String>(
              color: const Color.fromARGB(255, 47, 125, 121),
              dataSource: <Vendas>[
                Vendas(3000, "2023"),
                Vendas(3000, "2022"),
                Vendas(1600, "2022"),
                Vendas(1100, "2021"),
                Vendas(1300, "2020"),
              ], 
              xValueMapper: (Vendas v, index) => v.year, 
              yValueMapper: (Vendas v, index) => v.vendas
            )
          ]
           
          ),
      );
  }
}

class Vendas {
  final String year;
  final int vendas;

  Vendas( this.vendas,this.year,);
}