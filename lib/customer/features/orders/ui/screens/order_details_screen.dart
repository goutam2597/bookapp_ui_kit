import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:book_app/common/ui/widgets/status_info_card.dart';
import 'package:book_app/customer/features/orders/ui/screens/widgets/order_delivery_stepper.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ───── AppBar ─────
          const CustomAppBar(title: 'Order Details'),

          // ───── Main Scrollable Content ─────
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ───── Section: Order Header ─────
                    const OrderDeliveryStepper(activeStep: 2),
                    const SizedBox(height: 16),
                    const CustomHeaderTextWidget(text: 'Order Details'),
                    const SizedBox(height: 8),
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
                              // Booking Number and Status
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
                              // Booking Date
                              Text.rich(
                                TextSpan(
                                  style: AppTextStyles.bodySmall,
                                  text: 'Booking Date: ',
                                  children: const [
                                    TextSpan(text: '28th June 2025'),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Download Invoice Button
                              SizedBox(
                                height: 50,
                                child: CustomButtonWidget(
                                  fontSize: 18,
                                  text: 'Download Invoice',
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ───── Section: Ordered Product ─────
                    const CustomHeaderTextWidget(text: 'Ordered Product'),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: StatusInfoCard(
                        onTap: () {},
                        title: 'X-Drive Gaming Mouse',
                        qty: '01',
                        showQty: true,
                        showDate: false,
                        showPrice: true,
                        price: '\$79:99 ',
                        showTotalPrice: true,
                        totalPrice: '\$79:99 ',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ───── Section: Billing Address ─────
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

                    // ───── Section: Shipping Address ─────
                    const InformationCardWidget(
                      cardTitle: 'Shipping Address',
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

                    // ───── Section: Payment Information ─────
                    const InformationCardWidget(
                      cardTitle: 'Payment Information',
                      infoEntries: [
                        MapEntry('Cart Total:', '\$250.00'),
                        MapEntry('Discount:', '-\$8.00'),
                        MapEntry('Subtotal:', '-\$71.99'),
                        MapEntry('Tax: (5.00%):', '+\$3.60'),
                        MapEntry('Paid Amount:', '\$80.59'),
                        MapEntry('Payment Method:', 'Mollie'),
                        MapEntry('Payment Status:', 'Completed'),
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
