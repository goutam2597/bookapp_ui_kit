import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/vendor/features/withdrawal/ui/screens/request_withdrawal.dart';
import 'package:flutter/material.dart';

class MyBalance extends StatelessWidget {
  const MyBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'My Balance'),
          const SizedBox(height: 24),
          const Text(
            'My Balance : \$860.00',
            style: AppTextStyles.headingMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: SizedBox(
              height: 52,
              child: CustomButtonWidget(
                fontSize: 16,
                text: 'Make a Withdrawal Request',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RequestWithdrawal(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
