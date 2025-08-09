import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  // Stores current selected range values.
  SfRangeValues _values = const SfRangeValues(2.0, 8.0);

  // Histogram data for the bar chart under the slider.
  final List<_HistogramData> _chartData = [
    _HistogramData(0, 5),
    _HistogramData(1, 10),
    _HistogramData(2, 15),
    _HistogramData(3, 25),
    _HistogramData(4, 30),
    _HistogramData(5, 28),
    _HistogramData(6, 24),
    _HistogramData(7, 20),
    _HistogramData(8, 15),
    _HistogramData(9, 8),
    _HistogramData(10, 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ───── Range Selector with Histogram ─────
        SfRangeSelectorTheme(
          data: SfRangeSelectorThemeData(
            activeTrackColor: Colors.red,
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: Colors.white,
            overlayColor: Colors.red.withAlpha(100),
          ),
          child: SfRangeSelector(
            max: 10.0,
            initialValues: _values,
            interval: 1,
            onChanged: (dynamic newValues) {
              setState(() {
                _values = newValues as SfRangeValues;
              });
            },
            // Histogram chart shown below the slider.
            child: SizedBox(
              height: 100,
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis: const NumericAxis(isVisible: false),
                primaryYAxis: const NumericAxis(isVisible: false),
                series: <CartesianSeries>[
                  ColumnSeries<_HistogramData, double>(
                    dataSource: _chartData,
                    xValueMapper: (_HistogramData data, _) => data.x.toDouble(),
                    yValueMapper: (_HistogramData data, _) => data.y,
                    color: Colors.grey.withAlpha(300),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // ───── Display Selected Price Range ─────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${(_values.start * 20).toInt()}',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                '\$${(_values.end * 20).toInt()}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Simple class for chart data.
class _HistogramData {
  final int x;
  final double y;
  _HistogramData(this.x, this.y);
}
