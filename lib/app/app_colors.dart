import 'package:flutter/cupertino.dart';

/// Centralized color definitions used throughout the app.
class AppColors {
  // ───── Primary Theme Colors ─────
  static const Color themeColor = Color(0xffFF0037);
  static const Color themeColorTwo = Color(0xffFF4870);

  // ───── Accent & Supporting Colors ─────
  static const Color colorPink = Color(0xffF83758);
  static const Color colorText = Color(0xff182D53);
  static const Color titleColor = Color(0xff222B45);

  // ───── Global Gradient Style ─────
  static const LinearGradient themeGradient = LinearGradient(
    colors: [themeColor, themeColorTwo],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
