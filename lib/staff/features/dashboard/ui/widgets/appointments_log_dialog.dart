import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentLogDialog extends StatelessWidget {
  const AppointmentLogDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 320,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Appointment Details',
                      style: AppTextStyles.headingMedium,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(AssetsPath.cancelSvg, width: 22),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Divider(thickness: 1.2, color: Colors.grey.shade300),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader('Customer Details'),
                  const SizedBox(height: 8),
                  _infoText('Name', 'James Rodrigo'),
                  _infoText('Email', 'alexgreen@example.com'),
                  _infoText('Phone', '+001 2365 8987 126'),
                  const SizedBox(height: 8),
                  _sectionHeader('Payment Details'),
                  const SizedBox(height: 8),
                  _infoText('Package Price', '999'),
                  _infoText('Currency', 'NGN'),
                  _infoText('Method', 'Stripe'),
                  const SizedBox(height: 8),
                  _sectionHeader('Appointment Details'),
                  const SizedBox(height: 8),
                  _infoText('Appointment Date', 'Oct-29-2024'),
                  _infoText('Duration', '07:00 - 09:00'),
                  _infoText('Service Type', 'Offline'),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: AppTextStyles.headingMedium.copyWith(fontSize: 18),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '$label: ', style: AppTextStyles.bodyLarge),
            TextSpan(text: value, style: AppTextStyles.bodyLargeGrey),
          ],
        ),
      ),
    );
  }
}
