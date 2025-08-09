import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class TextNButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TextNButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Section title text
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),

        // "See All" gradient text button
        TextButton(
          onPressed: onTap,
          child: Text(
            'See All',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [AppColors.themeColor, AppColors.themeColorTwo],
                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
            ),
          ),
        ),
      ],
    );
  }
}
