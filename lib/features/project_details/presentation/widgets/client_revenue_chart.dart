import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

class ClientRevenueChart extends StatelessWidget {
  // final List<charts.Series> data;

  const ClientRevenueChart();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.withOpacity(0.1),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Client revenue",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.info_outline, size: 20, color: Colors.grey),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      getTitlesWidget: (value, meta) {
                        const years = ["2010", "2011", "2012", "2013", "2014", "2015", "2016"];
                        if (value.toInt() >= 0 && value.toInt() < years.length) {
                          return Text(years[value.toInt()], style: TextStyle(fontSize: 10));
                        }
                        return const SizedBox.shrink();
                      },
                      interval: 1,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      maxIncluded: true,
                      minIncluded: true,

                      getTitlesWidget: (value, meta) {
                        if(value.toInt() <= 100) {
                          return Text(value.toInt().toString(), style: TextStyle(fontSize: 10));
                        }
                        return const SizedBox.shrink();
                      },

                      interval: 20,
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  border: const Border(
                    left: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                gridData: FlGridData(show: false, drawVerticalLine: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 0),
                      FlSpot(1, 15),
                      FlSpot(2, 30),
                      FlSpot(3, 40),
                      FlSpot(4, 55),
                      FlSpot(5, 70),
                      FlSpot(6, 90),
                      FlSpot(7, 123.2),
                    ],
                    isCurved: true,
                    color: Colors.purple,
                    barWidth: 2,
                    dotData: FlDotData(show: true,),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 0),
                      FlSpot(1, 10),
                      FlSpot(2, 20),
                      FlSpot(3, 30),
                      FlSpot(4, 40),
                      FlSpot(5, 50),
                      FlSpot(6, 60),
                      FlSpot(7, 70),
                    ],
                    isCurved: true,
                    color: Colors.orange,
                    barWidth: 2,
                    dotData: FlDotData(show: true),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) {
                      return Colors.orange;
                    },
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          touchedSpot.y.toString(),
                          const TextStyle(color: Colors.white),
                        );
                      }).toList();
                    }
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(color: Colors.orange, label: "Value"),
              SizedBox(width: 16,),
              LegendItem(color: Colors.purple, label: "Value"),
            ],
          ),
        ],
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 5,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}