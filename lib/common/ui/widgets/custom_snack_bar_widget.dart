import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_app/app/app_colors.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void show(
    BuildContext context,
    String message, {
    String title = 'Success',
    SnackPosition snackPosition = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 3),
    Color backgroundColor = AppColors.themeColorTwo,
    Color textColor = Colors.white,
    double borderRadius = 8.0,
    double margin = 16.0,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: snackPosition,
      backgroundColor: backgroundColor,
      colorText: textColor,
      borderRadius: borderRadius,
      margin: EdgeInsets.all(margin),
      duration: duration,
    );
  }
}
