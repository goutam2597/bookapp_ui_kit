import 'package:book_app/app/app_colors.dart';
import 'package:book_app/customer/features/nav_bar/bottom_nav_bar.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/booking_text_button_widget.dart';
import 'package:flutter/material.dart';

/// Shows confirmation summary after booking/payment is completed.
class PaymentConfirmationScreen extends StatelessWidget {
  final VoidCallback onBackToHome;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedTimeSlot;
  final String? selectedPaymentMethod;

  const PaymentConfirmationScreen({
    super.key,
    required this.onBackToHome,
    required this.serviceCardModel,
    this.selectedStaff,
    this.selectedDate,
    this.selectedTimeSlot,
    this.selectedPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    // Format date for display
    final String formattedDate = selectedDate != null
        ? "${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}"
        : "-";

    // Collect all booking/payment details
    final bookingDetails = <MapEntry<String, String>>[
      MapEntry('Service Title:', serviceCardModel.title),
      MapEntry('Booking Date:', formattedDate),
      MapEntry('Appointment Date:', formattedDate),
      MapEntry('Appointment Time:', selectedTimeSlot ?? "-"),
      MapEntry('Vendor:', selectedStaff?.staffName ?? "-"),
      MapEntry('Paid Amount:', serviceCardModel.discountedPrice),
      MapEntry('Paid By:', selectedPaymentMethod ?? '-'),
      const MapEntry('Payment Status:', 'Completed'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const CustomHeaderTextWidget(text: 'Payment Confirmation'),
            const SizedBox(height: 16),
            _buildConfirmationHeader(),
            const SizedBox(height: 24),

            // Booking details card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InformationCardWidget(
                cardTitle: 'Booking Details',
                infoEntries: bookingDetails,
              ),
            ),

            const SizedBox(height: 16),
            // Back to Home button
            BookingTextButtonWidget(
              onTap: () {
                // Pop everything and go to home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBar()),
                  (route) => false,
                );
              },
              text: 'Back to Home',
              icon: Icons.arrow_back,
            ),
          ],
        ),
      ),
    );
  }

  /// Confirmation header with dynamic category and status text.
  Widget _buildConfirmationHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _headerText('Your'),
            _headerText(
              '( ${serviceCardModel.category} )',
              bold: true,
              color: AppColors.themeColor,
            ),
            _headerText('Service is Booked'),
          ],
        ),
        const SizedBox(height: 4),
        // Booking ID (hardcoded; you may make this dynamic in real app)
        const Text(
          'Booking ID: 12389',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.colorText,
          ),
        ),
        const SizedBox(height: 4),
        // Thank you message
        const Text(
          'Thank You',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  /// Utility for styled header text
  Widget _headerText(
    String text, {
    bool bold = false,
    Color color = const Color(0xFF757575),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
          color: color,
        ),
      ),
    );
  }
}
