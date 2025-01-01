import 'package:flutter/material.dart';
import 'package:flutter_application_1/graph_view.dart';
import 'package:flutter_application_1/value_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICPF Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [Icon(Icons.menu)],
      ),
      body: SingleChildScrollView(
        // Make the body scrollable
        child: Column(
          children: [
            Row(
              children: [
                ValueIndicator(
                  label: "Temperature",
                  value: 22.5,
                  min: 0,
                  max: 50,
                  unit: "°C",
                ),
                ValueIndicator(
                  label: "Humidity",
                  value: 60.0,
                  min: 0,
                  max: 100,
                  unit: "%",
                ),
              ],
            ),
            Row(
              children: [
                ValueIndicator(
                  label: "EC",
                  value: 1.2,
                  min: 0,
                  max: 2.5,
                  unit: "mS/cm",
                ),
                ValueIndicator(
                  label: "TDS",
                  value: 800.0,
                  min: 0,
                  max: 1500,
                  unit: "ppm",
                ),
              ],
            ),
            GraphTabView(), // Add the GraphTabView widget here
          ],
        ),
      ),
    );
  }
}
