import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class ValueIndicator extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final String unit;

  ValueIndicator({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    var first = ((max - min) / 4);
    var second = 2 * ((max - min) / 4);
    var third = 3 * ((max - min) / 4);

    return Column(
      children: [
        SizedBox(height: 20),
        Text(label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Container(
          padding: EdgeInsets.all(10),
          child: AnimatedRadialGauge(
            duration: const Duration(seconds: 1),
            curve: Curves.elasticOut,
            radius: 75,
            value: value,
            axis: GaugeAxis(
              min: min,
              max: max,
              degrees: 180,
              style: const GaugeAxisStyle(
                thickness: 15,
                background: Color.fromARGB(255, 250, 251, 255),
                segmentSpacing: 6,
              ),
              pointer: GaugePointer.needle(
                width: 16,
                height: 75,
                borderRadius: 16,
                color: Color.fromARGB(255, 78, 16, 11),
              ),
              progressBar: const GaugeProgressBar.rounded(
                color: Color.fromARGB(255, 241, 37, 22),
              ),
              segments: [
                GaugeSegment(from: 0, to: first, color: Color(0xFFD9DEEB)),
                GaugeSegment(from: first, to: second, color: Color(0xFFD9DEEB)),
                GaugeSegment(from: second, to: third, color: Color(0xFFD9DEEB)),
                GaugeSegment(
                    from: third, to: max - min, color: Color(0xFFD9DEEB)),
              ],
            ),
          ),
        ),
        Text(
          "${value.toStringAsFixed(1)} $unit",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
