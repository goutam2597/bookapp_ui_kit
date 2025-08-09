import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomSwitch({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      padding: EdgeInsets.zero,
      value: value,
      activeColor: Colors.white,
      activeTrackColor: AppColors.themeColor,
      inactiveThumbColor: AppColors.themeColor,
      inactiveTrackColor: Colors.grey.shade100,
      trackOutlineWidth: WidgetStateProperty.all(1),
      trackOutlineColor: const WidgetStatePropertyAll(AppColors.themeColor),
      onChanged: onChanged,
    );
  }
}
