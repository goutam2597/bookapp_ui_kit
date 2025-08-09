import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:flutter/material.dart';

class VendorAppointmentDetailsScreen extends StatelessWidget {
  final Map<String, String> booking;

  const VendorAppointmentDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Appointment Details'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationCardWidget(
                      cardTitle: 'Booking No: #${booking['id']}',
                      infoEntries: [
                        MapEntry('Service Title:', '${booking['title']}'),
                        MapEntry('Booking Date:', '${booking['date']}'),
                        MapEntry('Appointment Date:', '${booking['date']}'),
                        MapEntry('Appointment Time:', '03:00 - 05:00'),
                        MapEntry('Person ', '01'),
                        MapEntry('Price:', '${booking['price']}'),
                        MapEntry(
                          'Payment Status:',
                          '${booking['paymentStatus']}',
                        ),
                        MapEntry('Appointment Status:', 'Pending'),
                      ],
                    ),
                    SizedBox(height: 16),
                    InformationCardWidget(
                      cardTitle: 'Billing Details',
                      infoEntries: [
                        MapEntry('Name:', 'KreativDev'),
                        MapEntry('Email:', 'ranaahmed269205@gmail.com'),
                        MapEntry('Phone:', ' +880123456789'),
                        MapEntry(
                          'Address:',
                          'KreativDev, Road-3, Dhaka, Bangladesh',
                        ),
                        MapEntry('Country :', 'Bangladesh'),
                      ],
                    ),
                    SizedBox(height: 16),
                    InformationCardWidget(
                      cardTitle: 'Staff Details',
                      infoEntries: [
                        MapEntry('Name:', 'Sophia Lee'),
                        MapEntry('Email:', 'sophialee@example.com'),
                        MapEntry('Phone:', '+1-234-567-8903'),
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
