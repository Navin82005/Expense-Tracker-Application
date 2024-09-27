import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 20, color: Colors.amber),
          PieChartSectionData(value: 20, color: Colors.amber),
          PieChartSectionData(value: 20, color: Colors.amber),
          PieChartSectionData(value: 20, color: Colors.amber),
          PieChartSectionData(value: 20, color: Colors.amber),
        ],
      ),
    );
  }
}
