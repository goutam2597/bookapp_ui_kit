import 'package:book_app/app/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeChartWidget extends StatelessWidget {
  const IncomeChartWidget({super.key});

  static const List<double> values = [0.7, 0.5, 1.0, 0.75, 0.4, 0.7];
  static const List<double> lightTops = [0.3, 0.2, 0.25, 0.1, 0.18, 0.25];
  static const List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
  static const List<int> incomes = [400, 320, 500, 410, 290, 410];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 1,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          groupsSpace: 20,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBorder: BorderSide(color: Colors.grey.shade300),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${months[group.x]}\nIncome: \$${incomes[group.x]}',
                  const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              axisNameWidget: const SizedBox(),
              axisNameSize: 0,
              sideTitles: SideTitles(
                showTitles: true,
                interval: 0.1,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return Text(
                    value.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 10, color: Colors.black38),
                  );
                },
                reservedSize: 20,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: const SizedBox(),
              axisNameSize: 0,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final int v = value.toInt();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      (v >= 0 && v < months.length) ? months[v] : '',
                      style: const TextStyle(fontSize: 13),
                    ),
                  );
                },
                reservedSize: 32,
              ),
            ),
            rightTitles: const AxisTitles(),
            topTitles: const AxisTitles(),
          ),
          barGroups: List.generate(months.length, (i) {
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  width: 12,
                  fromY: 0,
                  toY: values[i],
                  borderRadius: BorderRadius.circular(02),
                  rodStackItems: [
                    BarChartRodStackItem(0, lightTops[i], AppColors.themeColor),
                    BarChartRodStackItem(
                      lightTops[i],
                      values[i],
                      Colors.redAccent.shade100,
                    ),
                  ],
                ),
              ],
            );
          }),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 0,
                color: Colors.red.shade300,
                strokeWidth: 1.2,
                dashArray: [2, 2],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
