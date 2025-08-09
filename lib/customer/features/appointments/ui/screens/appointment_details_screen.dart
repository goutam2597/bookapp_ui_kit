import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:flutter/material.dart';

/// Shows all details of a single appointment.
class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // AppBar
          const CustomAppBar(title: 'Appointment details'),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(), // Smooth scroll
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Booking Info Card
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        elevation: 0.5,
                        margin: const EdgeInsets.only(
                          bottom: 12,
                          left: 2,
                          right: 2,
                        ),
                        color: Colors.grey.shade50,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Booking No: #685fcb31cf506',
                                  style: AppTextStyles.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' [Pending]',
                                      style: AppTextStyles.bodyLarge.copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text.rich(
                                TextSpan(
                                  style: AppTextStyles.bodySmall,
                                  text: 'Booking Date: ',
                                  children: const [
                                    TextSpan(text: '28th June 2025'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Details Cards (Information, Payment, Billing, Vendor)
                    const InformationCardWidget(
                      cardTitle: 'Booking Details',
                      infoEntries: [
                        MapEntry(
                          'Service Title:',
                          'Advanced Diagnostic Screening',
                        ),
                        MapEntry(
                          'Service Address:',
                          '456 Wellness Blvd, Monroe, NC, USA',
                        ),
                        MapEntry('Appointment Date:', '30th June 2025'),
                        MapEntry('Appointment Time:', '01:30 - 02:00'),
                        MapEntry('Person:', '01'),
                        MapEntry('Staff Name:', 'Emily Davis'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const InformationCardWidget(
                      cardTitle: 'Payment Information',
                      infoEntries: [
                        MapEntry('Paid Amount:', '\$250.00'),
                        MapEntry('Payment Method:', 'Stripe'),
                        MapEntry('Payment Status:', 'Completed'),
                        MapEntry('Booking Status:', 'Pending'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const InformationCardWidget(
                      cardTitle: 'Billing Address',
                      infoEntries: [
                        MapEntry('Name:', 'LumiJet'),
                        MapEntry('Email Address:', 'user@example.com'),
                        MapEntry('Phone:', '+1 (195) 312-1866'),
                        MapEntry('Country:', 'Australia'),
                        MapEntry(
                          'Address:',
                          '123 Queen Street West, Toronto, Ontario, M5V 3L9, Canada',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const InformationCardWidget(
                      cardTitle: 'Vendor Details',
                      infoEntries: [
                        MapEntry('Name:', 'LumiJet'),
                        MapEntry('Email Address:', 'user@example.com'),
                        MapEntry('Phone:', '+1 (195) 312-1866'),
                        MapEntry('Country:', 'Australia'),
                        MapEntry(
                          'Address:',
                          '123 Queen Street West, Toronto, Ontario, M5V 3L9, Canada',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
