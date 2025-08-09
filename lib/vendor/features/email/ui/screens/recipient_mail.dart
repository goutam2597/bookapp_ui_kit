import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class RecipientMail extends StatelessWidget {
  const RecipientMail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Recipient Mail'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTextWidget(text: 'Mail to Vendor'),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    textAlign: TextAlign.center,
                    'This mail address will be used to receive all mails from customers.',
                  ),
                ),
                const CustomTextField(
                  headerText: 'Email Address*',
                  hintText: 'yourmail@example.com',
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 52,
                  child: CustomButtonWidget(
                    text: 'Update',
                    onPressed: () {
                      CustomSnackBar.show(
                        snackPosition: SnackPosition.BOTTOM,
                        context,
                        'Mail info updated successfully!',
                      );
                    },
                    fontSize: 16,
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
