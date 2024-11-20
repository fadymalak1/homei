import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RawMaterialsChart extends StatefulWidget {
  // final List<charts.Series> data;

  const RawMaterialsChart();

  @override
  State<RawMaterialsChart> createState() => _RawMaterialsChartState();
}

class _RawMaterialsChartState extends State<RawMaterialsChart> {

  int touchedIndex = -1;

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
          // Title and Icon
          Row(
            children: [
              Text(
                'Raw materials',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.info_outline, size: 20, color: Colors.grey),
            ],
          ),
          SizedBox(height: 10),
          // Chart Container
          AspectRatio(
            aspectRatio: 1.5,
            child: PieChart(
              PieChartData(
                sections: _getSections(),
                centerSpaceRadius: 40,
                sectionsSpace: 0,
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Legend
             Wrap(
              children:[
                buildLegend(),
              ],
            ),

        ],
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      PieChartSectionData(
        value: 34,
        color: Colors.orange,
        title: '34%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 15,
        color: Colors.grey[300],
        title: '15%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 11,
        color: Colors.lightBlueAccent,
        title: '11%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 11,
        color: Colors.indigo,
        title: '11%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 10,
        color: Colors.deepOrange,
        title: '10%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 6,
        color: Colors.grey[600],
        title: '6%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 5,
        color: Colors.grey[500],
        title: '5%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 3,
        color: Colors.grey[400],
        title: '3%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      PieChartSectionData(
        value: 2,
        color: Colors.grey[700],
        title: '2%',
        radius: 60,
        titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Colors.white),
      ),
    ];
  }

  Widget buildLegend() {
    final legends = [
      {'color': Colors.orange, 'text': 'Product 1'},
      {'color': Colors.grey[300], 'text': 'Product 2'},
      {'color': Colors.lightBlueAccent, 'text': 'Product 3'},
      {'color': Colors.indigo, 'text': 'Product 4'},
      {'color': Colors.deepOrange, 'text': 'Product 5'},
      {'color': Colors.grey[600], 'text': 'Product 6'},
      {'color': Colors.grey[500], 'text': 'Product 7'},
      {'color': Colors.grey[400], 'text': 'Product 8'},
      {'color': Colors.orange[300], 'text': 'Product 9'},
    ];

    // Group items into rows of 3
    return Column(
      children: List.generate((legends.length / 3).ceil(), (rowIndex) {
        int startIndex = rowIndex * 3;
        int endIndex = (rowIndex + 1) * 3;
        List<Map<String, dynamic>> rowItems = legends.sublist(
          startIndex,
          endIndex > legends.length ? legends.length : endIndex,
        );

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowItems.map((legend) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: legend['color'] as Color?,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  legend['text'] as String,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            );
          }).toList(),
        );
      }),
    );
  }
}