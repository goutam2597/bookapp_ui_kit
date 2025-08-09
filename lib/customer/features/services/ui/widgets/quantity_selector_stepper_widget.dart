import 'package:flutter/material.dart';

class QuantitySelectorStepperWidget extends StatefulWidget {
  const QuantitySelectorStepperWidget({super.key});

  @override
  State<QuantitySelectorStepperWidget> createState() =>
      _QuantitySelectorStepperWidgetState();
}

class _QuantitySelectorStepperWidgetState
    extends State<QuantitySelectorStepperWidget> {
  int quantity = 1;

  // Increments the quantity by 1.
  void _increment() => setState(() => quantity++);

  // Decrements the quantity by 1 (min value is 1).
  void _decrement() {
    if (quantity > 1) setState(() => quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ───── Decrement Button ─────
          InkWell(
            onTap: _decrement,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '-',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // ───── Quantity Value ─────
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // ───── Increment Button ─────
          InkWell(
            onTap: _increment,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '+',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
