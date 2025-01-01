import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

Widget ValueIndicator() {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      Text("Temperature"),
      Container(
        padding: EdgeInsets.all(10),
        child: AnimatedRadialGauge(

            /// The animation duration.
            duration: const Duration(seconds: 1),
            curve: Curves.elasticOut,

            /// Define the radius.
            /// If you omit this value, the parent size will be used, if possible.
            radius: 75,

            /// Gauge value.
            value: 15,

            /// Optionally, you can configure your gauge, providing additional
            /// styles and transformers.
            axis: GaugeAxis(

                /// Provide the [min] and [max] value for the [value] argument.
                min: 0,
                max: 50,

                /// Render the gauge as a 180-degree arc.
                degrees: 180,

                /// Set the background color and axis thickness.
                style: const GaugeAxisStyle(
                  thickness: 15,
                  background: Color.fromARGB(255, 250, 251, 255),
                  segmentSpacing: 6,
                ),

                /// Define the pointer that will indicate the progress (optional).
                pointer: GaugePointer.needle(
                  width: 16,
                  height: 75,
                  borderRadius: 16,
                  color: Color.fromARGB(255, 78, 16, 11),
                ),

                /// Define the progress bar (optional).
                progressBar: const GaugeProgressBar.rounded(
                  color: Color.fromARGB(255, 241, 37, 22),
                ),

                /// Define axis segments (optional).
                segments: [
                  const GaugeSegment(
                    from: 0,
                    to: 12.5,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  const GaugeSegment(
                    from: 12.5,
                    to: 25,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                  const GaugeSegment(
                    from: 25,
                    to: 37.5,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.circular(2.0),
                  ),
                  const GaugeSegment(
                    from: 37.5,
                    to: 50,
                    color: Color(0xFFD9DEEB),
                    cornerRadius: Radius.zero,
                  ),
                ]

                /// You can also, define the child builder.
                /// You will build a value label in the following way, but you can use the widget of your choice.
                ///
                /// For non-value related widgets, take a look at the [child] parameter.
                /// ```
                /// builder: (context, child, value) => RadialGaugeLabel(
                ///  value: value,
                ///  style: const TextStyle(
                ///    color: Colors.black,
                ///    fontSize: 46,
                ///    fontWeight: FontWeight.bold,
                ///  ),
                /// ),
                /// ```
                )),
      ),
      Text("15°C"),
      SizedBox(
        height: 20,
      )
    ],
  );
}
