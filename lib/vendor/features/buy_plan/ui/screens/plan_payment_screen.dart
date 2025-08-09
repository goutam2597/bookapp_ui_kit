import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/vendor/features/buy_plan/data/models/buy_plans_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class PlanPaymentScreen extends StatefulWidget {
  final PlanModel selectedPlan;

  const PlanPaymentScreen({super.key, required this.selectedPlan});

  @override
  State<PlanPaymentScreen> createState() => _PlanPaymentScreenState();
}

class _PlanPaymentScreenState extends State<PlanPaymentScreen> {
  String? selectedPaymentMethod;
  final List<String> paymentMethods = [
    'PayPal',
    'Instamojo',
    'Paystack',
    'Flutterwave',
    'Razorpay',
    'MercadoPago',
    'Mollie',
    'Stripe',
    'Paytm',
    'Authorize.net',
    'Bank of America',
    'Citibank',
  ];

  String getFormattedExpireDate(DateTime startDate) {
    final validity = widget.selectedPlan.validityType.toLowerCase();

    if (validity.contains('year')) {
      return "${DateTime(startDate.year + 1, startDate.month, startDate.day).toString().split(' ')[0]}";
    } else if (validity.contains('month')) {
      return "${DateTime(startDate.year, startDate.month + 1, startDate.day).toString().split(' ')[0]}";
    } else if (validity.contains('lifetime')) {
      return "Lifetime";
    } else {
      return "N/A";
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedStartDate = now.toString().split(' ')[0];
    final String formattedExpireDate = getFormattedExpireDate(now);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Buy Plan'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          widget.selectedPlan.planType,
                          style: AppTextStyles.headingLarge,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "\$${widget.selectedPlan.priceCount.toString()} / ${widget.selectedPlan.validityType}",
                          style: AppTextStyles.headingLarge.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 16),
                        // Membership info
                        _buildDetailRow('Membership', 'Yes'),

                        // Start Date
                        const Divider(),
                        _buildDetailRow('Start Date', formattedStartDate),

                        // Expire Date (based on plan logic)
                        const Divider(),
                        _buildDetailRow('Expire Date', formattedExpireDate),

                        // Repeated fields (for layout completeness)
                        const Divider(),
                        _buildDetailRow(
                          'Total Cost',
                          '\$${widget.selectedPlan.priceCount.toString()}',
                        ),
                        const Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: CustomHeaderTextWidget(
                            text: 'Payment Method',
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Container(
                            height: 56,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                borderRadius: BorderRadius.circular(12),
                                dropdownColor: Colors.white,
                                hint: const Text('Choose a Payment Method'),
                                value: selectedPaymentMethod,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentMethod = value;
                                  });
                                },
                                items: paymentMethods.map((method) {
                                  return DropdownMenuItem<String>(
                                    value: method,
                                    child: Text(method),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            height: 52,
                            child: CustomButtonWidget(
                              text: 'Checkout Now',
                              onPressed: () {
                                if (selectedPaymentMethod != null) {
                                  CustomSnackBar.show(
                                    snackPosition: SnackPosition.BOTTOM,
                                    context,
                                    'Plan Purchase Successful!',
                                  );
                                } else {
                                  CustomSnackBar.show(
                                    snackPosition: SnackPosition.BOTTOM,
                                    context,
                                    'Please Select A Payment Method',
                                  );
                                }
                              },
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable detail row widget
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
