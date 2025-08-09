import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

/// A custom gradient button with proper ripple and shadow.
class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final double? fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;

  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 8.0,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.themeGradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 14,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
