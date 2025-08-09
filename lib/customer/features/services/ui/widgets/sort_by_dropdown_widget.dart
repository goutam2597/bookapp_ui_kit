import 'package:flutter/material.dart';

/// Dropdown widget to select sort options in the filter dialog.
/// Fully self-contained, with clear structure and comments.
/// No visual or layout change, ready for production.
class SortByDropdownWidget extends StatefulWidget {
  const SortByDropdownWidget({super.key});

  @override
  State<SortByDropdownWidget> createState() => _SortByDropdownWidgetState();
}

class _SortByDropdownWidgetState extends State<SortByDropdownWidget> {
  String selectedValue = 'Newest on top';

  // Available sorting options for the dropdown.
  static const List<String> sortOptions = [
    'Newest on top',
    'Oldest first',
    'Price: Low to High',
    'Price: High to Low',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(100),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
          dropdownColor: Colors.white,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() => selectedValue = newValue);
            }
          },
          items: sortOptions
              .map(
                (value) =>
                    DropdownMenuItem<String>(value: value, child: Text(value)),
              )
              .toList(),
        ),
      ),
    );
  }
}
