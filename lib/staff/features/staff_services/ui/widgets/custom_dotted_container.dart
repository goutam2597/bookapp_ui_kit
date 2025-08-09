import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CustomDottedContainer extends StatelessWidget {
  final String icon;
  final String text;
  final double? iconHeight;
  final double? iconWidth;
  final bool showCircle;
  final bool showRectangle;
  final VoidCallback onTap;
  const CustomDottedContainer({
    super.key,
    required this.icon,
    required this.text,
    this.showCircle = false,
    this.showRectangle = true,
    this.iconHeight = 32.0,
    this.iconWidth = 32.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        color: Colors.grey.shade300,
        dashPattern: [15, 10],
        strokeWidth: 1.5,
        padding: EdgeInsets.zero,
        radius: const Radius.circular(8),
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 156,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButtonWidget(
              showCircle: showCircle,
              showRectangle: showRectangle,
              assetPath: icon,
              height: 60,
              width: 60,
              iconHeight: iconHeight,
              iconWidth: iconWidth,
              onTap: onTap,
            ),
            const SizedBox(height: 32),
            Text(text, style: AppTextStyles.bodyLargeGrey),
          ],
        ),
      ),
    );
  }
}
