import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraphTabView extends StatefulWidget {
  @override
  _GraphTabViewState createState() => _GraphTabViewState();
}

class _GraphTabViewState extends State<GraphTabView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Temperature"),
            Tab(text: "Humidity"),
            Tab(text: "TDS"),
          ],
        ),
        Container(
          height: 300, // Set a height for the chart area
          child: TabBarView(
            controller: _tabController,
            children: [
              LineChartWidget(
                  data: [15, 20, 25, 30, 28], label: "Temperature (°C)"),
              LineChartWidget(
                  data: [50, 60, 70, 80, 75], label: "Humidity (%)"),
              LineChartWidget(
                  data: [500, 600, 700, 800, 750], label: "TDS (ppm)"),
            ],
          ),
        ),
      ],
    );
  }
}

class LineChartWidget extends StatelessWidget {
  final List<double> data;
  final String label;

  LineChartWidget({required this.data, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: data
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(entry.key.toDouble(), entry.value))
                  .toList(),
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
          titlesData: FlTitlesData(),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
        ),
      ),
    );
  }
}
