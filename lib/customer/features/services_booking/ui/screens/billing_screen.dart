import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/booking_text_button_widget.dart';
import 'package:flutter/material.dart';

/// BillingScreen: Collects user's billing details during the booking flow.
class BillingScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedTimeSlot;

  const BillingScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.serviceCardModel,
    required this.selectedStaff,
    required this.selectedDate,
    this.selectedTimeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Screen Title
              const Center(
                child: CustomHeaderTextWidget(text: 'Billing Details'),
              ),
              const SizedBox(height: 32),

              // Full Name
              const FormHeaderTextWidget(text: 'Full Name*'),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 16),

              // Phone Number
              const FormHeaderTextWidget(text: 'Phone Number*'),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 16),

              // Email
              const FormHeaderTextWidget(text: 'Email Address*'),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 16),

              // Address
              const FormHeaderTextWidget(text: 'Address*'),
              const SizedBox(height: 4),
              const TextField(),
              const SizedBox(height: 16),

              // Zip + Country Row
              _buildRowFields(),

              const SizedBox(height: 16),

              // Navigation Buttons
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the row containing the Zip and Country fields
  Widget _buildRowFields() {
    return const Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderTextWidget(text: 'Postcode/Zip'),
              SizedBox(height: 4),
              TextField(),
            ],
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderTextWidget(text: 'Country'),
              SizedBox(height: 4),
              TextField(),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds the navigation buttons for previous/next step
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BookingTextButtonWidget(
          onTap: onBack,
          text: 'Previous Step',
          icon: Icons.arrow_back,
        ),
        BookingTextButtonWidget(
          onTap: onNext,
          text: 'Next Step',
          icon: Icons.arrow_forward,
          iconRight: true,
          textColor: AppColors.themeColor,
          iconColor: AppColors.themeColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
