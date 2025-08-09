import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/booking_text_button_widget.dart';
import 'package:flutter/material.dart';

/// Payment screen with payment method dropdown and confirmation button.
/// Integrates with booking flow.
class PaymentScreen extends StatefulWidget {
  final VoidCallback onBack;
  final void Function(String paymentMethod) onPaymentComplete;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedTimeSlot;

  const PaymentScreen({
    super.key,
    required this.onBack,
    required this.onPaymentComplete,
    required this.serviceCardModel,
    this.selectedStaff,
    this.selectedDate,
    this.selectedTimeSlot,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedPaymentMethod;

  // List of payment options. You can add/remove as needed.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomHeaderTextWidget(text: 'Select Payment Method'),
              const SizedBox(height: 16),

              // ── Payment Method Dropdown ──
              Container(
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

              const SizedBox(height: 24),

              // ── Payment Button ──
              SizedBox(
                height: 56,
                child: CustomButtonWidget(
                  text: 'Make Payment',
                  onPressed: () {
                    if (selectedPaymentMethod != null) {
                      widget.onPaymentComplete(selectedPaymentMethod!);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a payment method'),
                        ),
                      );
                    }
                  },
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 16),

              // ── Previous Step Button ──
              BookingTextButtonWidget(
                onTap: widget.onBack,
                text: 'Previous Step',
                icon: Icons.arrow_back,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
