import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangeStaffPassword extends StatelessWidget {
  const ChangeStaffPassword({super.key});

  /// Handler for updating password (API integration placeholder)
  void _handleUpdatePassword() {
    debugPrint('Update Password button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Change Password'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // ───── Password Fields ─────
                    const CustomTextField(headerText: 'Current Password*'),
                    const SizedBox(height: 16),
                    const CustomTextField(headerText: 'New Password*'),
                    const SizedBox(height: 16),
                    const CustomTextField(headerText: 'Confirm New Password*'),
                    const SizedBox(height: 16),

                    // ───── Update Button ─────
                    SizedBox(
                      height: 52,
                      child: CustomButtonWidget(
                        text: 'Update Password',
                        onPressed: _handleUpdatePassword,
                        fontSize: 16,
                      ),
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
