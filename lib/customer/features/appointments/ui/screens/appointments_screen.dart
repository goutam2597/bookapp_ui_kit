import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/common/ui/widgets/status_info_card.dart';
import 'package:book_app/customer/features/appointments/models/appointment_model.dart';
import 'package:book_app/customer/features/appointments/ui/screens/appointment_details_screen.dart';
import 'package:book_app/customer/features/home/ui/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../app/app_colors.dart';
import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';
import '../../../../../common/ui/widgets/dropdown_alert_dialog.dart';

/// Displays list of user appointments with status indicators
class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final List<String> languages = ['English', 'Arabic', 'Spanish'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // ───── Section Title ─────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 0.1,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Appointments',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // ───── Scrollable Appointment List ─────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(), // Smooth scroll
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final item = appointments[index];
                  return StatusInfoCard(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const AppointmentDetailsScreen(),
                        ),
                      );
                    },
                    title: item.title,
                    provider: item.provider,
                    time: item.time,
                    date: item.date,
                    status: item.status,
                    showProvider: true,
                    showTime: true,
                    showStatus: true,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ───── Custom AppBar Widget ─────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AssetsPath.appLogoSvg, height: 24, width: 125),
            Row(
              children: [
                CustomIconButtonWidget(
                  assetPath: AssetsPath.notificationIconSvg,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                CustomIconButtonWidget(
                  assetPath: AssetsPath.languageSvg,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => DropdownAlertDialog(
                        dialogType: DialogType.dropdown,
                        drpDownTitle: 'Select Language',
                        title: 'Select Language',
                        btnTitle: 'Save',
                        items: languages,
                        onConfirm: (selectedValue) {
                          if (selectedValue != null) {
                            return CustomSnackBar.show(
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.themeColor,
                              context,
                              '$selectedValue is Selected Now',
                            );
                          } else {
                            return CustomSnackBar.show(
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.themeColorTwo,
                              context,
                              'English is The Default Language',
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
