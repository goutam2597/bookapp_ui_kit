import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:book_app/vendor/features/common_widgets/reusable_dropdown_widget.dart';
import 'package:flutter/material.dart';

class RequestWithdrawal extends StatefulWidget {
  const RequestWithdrawal({super.key});

  @override
  State<RequestWithdrawal> createState() => _RequestWithdrawalState();
}

class _RequestWithdrawalState extends State<RequestWithdrawal> {
  final List<String> items = ['Bank Transfer', 'Mobile Banking', 'Cash'];

  // Selected value
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Request Withdrawal'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'My Balance : \$860.00',
                    style: AppTextStyles.headingMedium,
                  ),
                ),
                const SizedBox(height: 30),
                const CustomHeaderTextWidget(
                  text: 'Withdraw Method*',
                  fontSize: 16,
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ReusableDropdownWidget(
                    title: 'Choose a Payment Method',
                    selectedValue: selectedValue,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  hintText: 'Enter Withdraw Amount',
                  fontWeight: FontWeight.w600,
                  headerText: 'Withdraw Amount*',
                ),
                const SizedBox(height: 16),
                const CustomTextField(
                  hintText: 'Additional Reference (Optional)',
                  fontWeight: FontWeight.w600,
                  headerText: 'Additional Reference',
                ),

                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: CustomButtonWidget(
                    fontSize: 16,
                    onPressed: () {},
                    text: 'Send Request',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
