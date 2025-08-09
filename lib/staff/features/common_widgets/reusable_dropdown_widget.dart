import 'package:flutter/material.dart';

/// A small, reusable dropdown widget with optional navigation on selection
class ReusableDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final void Function(String?) onChanged;
  final String title;
  final Map<String, Widget>? navigationRoutes;

  const ReusableDropdownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.title,
    this.navigationRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(title),
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (value) {
            onChanged(value);

            // Handle optional navigation if route exists for selected item
            if (value != null &&
                navigationRoutes != null &&
                navigationRoutes!.containsKey(value)) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => navigationRoutes![value]!),
              );
            }
          },
        ),
      ),
    );
  }
}
