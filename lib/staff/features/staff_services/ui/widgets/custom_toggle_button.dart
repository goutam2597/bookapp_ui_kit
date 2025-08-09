import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final bool isEnabled;
  final String leftLabel;
  final String rightLabel;
  final void Function(bool) onChanged;

  const CustomToggleButton({
    super.key,
    required this.isEnabled,
    required this.onChanged,
    this.leftLabel = 'Enable',
    this.rightLabel = 'Disable',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Enable Button
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: isEnabled
                      ? const LinearGradient(
                          colors: [
                            AppColors.themeColor,
                            AppColors.themeColorTwo,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isEnabled ? null : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  leftLabel,
                  style: TextStyle(
                    color: isEnabled ? Colors.white : Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),

          // Disable Button
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: !isEnabled
                      ? const LinearGradient(
                          colors: [
                            AppColors.themeColor,
                            AppColors.themeColorTwo,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: !isEnabled ? null : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  rightLabel,
                  style: TextStyle(
                    color: !isEnabled ? Colors.white : Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
