import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

/// A reusable card widget to display key-value information pairs with aligned rows.
class InformationCardWidget extends StatelessWidget {
  final String cardTitle;
  final List<MapEntry<String, String>> infoEntries;
  final bool showSecondCell;
  final bool showThirdCell;

  const InformationCardWidget({
    super.key,
    required this.cardTitle,
    required this.infoEntries,
    this.showSecondCell = true,
    this.showThirdCell = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Center(
            child: Text(
              cardTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.colorText,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Divider(color: Colors.grey.shade300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(6),
                1: FlexColumnWidth(7),
              },
              children: infoEntries.map((entry) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        entry.key,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade700,
                        ),
                        maxLines: 2, // or remove if you want unlimited
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    if (showSecondCell)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          textAlign: TextAlign.right,
                          entry.value,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (showThirdCell)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          height: 24,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                            textAlign: TextAlign.right,
                            entry.value,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
