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
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: 350,
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          
        ),
      )
    );
  }
}

class Vendas {
  final String year;
  final String vendas;

  Vendas(this.year, this.vendas);
}