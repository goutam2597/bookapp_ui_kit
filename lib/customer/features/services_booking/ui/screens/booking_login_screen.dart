import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/auth/ui/widget/login_screen_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/booking_text_button_widget.dart';
import 'package:flutter/material.dart';

/// BookingLoginScreen: Used in booking flow for login or guest checkout.
class BookingLoginScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedTimeSlot;

  const BookingLoginScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.serviceCardModel,
    this.selectedStaff,
    this.selectedDate,
    this.selectedTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Screen Header
              const CustomHeaderTextWidget(text: 'Login'),
              const SizedBox(height: 16),
              // Guest Checkout Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  maximumSize: const Size(304, 44),
                  backgroundColor: Colors.white,
                  textStyle: const TextStyle(color: AppColors.themeColor),
                ),
                onPressed: onNext,
                child: const Text(
                  'Proceed As Guest Checkout',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Login Form Widget
              LoginScreenWidget(onTap: onNext,onSignUpTap: (){},),
              const SizedBox(height: 8),
              // Previous Step Button
              SizedBox(
                width: 164,
                child: BookingTextButtonWidget(
                  onTap: onBack,
                  icon: Icons.arrow_back,
                  text: 'Previous Step',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
