import 'package:flutter/material.dart';

/// Custom stepper for multi-step flows (e.g., booking)
/// Shows labeled steps with active and completed states
class OrderDeliveryStepper extends StatelessWidget {
  final int activeStep;

  const OrderDeliveryStepper({super.key, required this.activeStep});

  static const double _circleDiameter = 32.0;
  static const double _lineWidth = 5.0;

  @override
  Widget build(BuildContext context) {
    // Define step data
    final List<Map<String, dynamic>> steps = [
      {'label': 'Order Placed', 'isCompleted': activeStep > 1},
      {'label': 'Out For Delivery', 'isCompleted': activeStep > 2},
      {'label': 'Delivered', 'isCompleted': activeStep > 3},
    ];

    return SizedBox(
      height: 61,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Step line background
          Positioned(
            top: _circleDiameter / 1.8 - _lineWidth / 1.8,
            left: _circleDiameter / 0.5,
            right: _circleDiameter / 0.5,
            child: Container(height: _lineWidth, color: Colors.grey.shade300),
          ),
          // Steps row
          Row(
            children: steps.asMap().entries.map((entry) {
              final int index = entry.key;
              final Map<String, dynamic> step = entry.value;
              return Expanded(
                child: _buildStep(
                  label: step['label'] as String,
                  isCompleted: step['isCompleted'] as bool,
                  isActive: activeStep == index + 1,
                  number: '${index + 1}',
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Step circle and label
  Widget _buildStep({
    required String label,
    required bool isCompleted,
    required bool isActive,
    required String number,
  }) {
    final Color circleColor = isCompleted
        ? const Color(0xFF5CB85C)
        : Colors.white;
    final Color borderColor = isCompleted
        ? const Color(0xFF5CB85C)
        : Colors.grey.shade400;
    final Color labelColor = isActive
        ? const Color(0xFF3F51B5)
        : Colors.black54;
    final FontWeight labelWeight = isActive
        ? FontWeight.bold
        : FontWeight.normal;

    final Widget child = isCompleted
        ? const Icon(Icons.check, color: Colors.white, size: 20)
        : Text(
            number,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _circleDiameter,
          height: _circleDiameter,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor),
          ),
          child: Center(child: child),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: labelColor,
            fontWeight: labelWeight,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
