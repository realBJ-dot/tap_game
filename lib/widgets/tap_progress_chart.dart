import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TapProgressChart extends StatelessWidget {
  // global var for progress
  final double progressPercent;

  TapProgressChart({Key? key, required this.progressPercent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      annotations: <CircularChartAnnotation>[ // for circular progress bar
        CircularChartAnnotation(
          widget: Container(
            child: Text(
              '${progressPercent.toStringAsFixed(0)}%',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
      series: <CircularSeries>[
        DoughnutSeries<ChartData, String>(
          dataSource: [
            ChartData('Completed', progressPercent, Colors.orange[700]!),
            ChartData('Remaining', 100 - progressPercent, Colors.grey[700]!),
          ],
          pointColorMapper: (ChartData data, _) => data.color,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          radius: '100%',
          innerRadius: '80%',
          strokeWidth: 20,
          startAngle: 270, // Adjust the start angle
          endAngle: 270, // Adjust the end angle
        ),
      ],
    );
  }
}

class ChartData {
  String x;
  double y;
  Color color;

  ChartData(this.x, this.y, this.color);
}
