import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class AppointmentsSettings extends StatefulWidget {
  const AppointmentsSettings({super.key});

  @override
  State<AppointmentsSettings> createState() => _AppointmentsSettingsState();
}

class _AppointmentsSettingsState extends State<AppointmentsSettings> {
  bool isServiceEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Update Settings'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTextWidget(
                  text: 'Automatic Booking Approval*',
                  fontSize: 16,
                ),
                const SizedBox(height: 8),
                // Toggle between "Activate" and "Deactivate"
                SizedBox(
                  height: 56,
                  child: CustomToggleButton(
                    leftLabel: 'Activate',
                    rightLabel: 'Deactivate',
                    isEnabled: isServiceEnabled,
                    onChanged: (val) => setState(() => isServiceEnabled = val),
                  ),
                ),
                const SizedBox(height: 24),
                // Update button — API call can be integrated here
                SizedBox(
                  height: 52,
                  child: CustomButtonWidget(
                    text: 'Update',
                    onPressed: _handleUpdateSettings,
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

  /// This method will later be used to call the API for updating settings
  void _handleUpdateSettings() {

    CustomSnackBar.show(
      snackPosition: SnackPosition.BOTTOM,
      context,
      'Approval Settings Updated!',
    );
  }
}
