import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/customer/features/auth/ui/widget/login_screen_widget.dart';
import 'package:book_app/staff/features/nav_app_bar/ui/screens/staff_nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Vendor Login Screen
class StaffLoginScreen extends StatelessWidget {
  const StaffLoginScreen({super.key});

  /// Navigate to Staff dashboard after successful login
  void _handleLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const StaffNavAppBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ───── Title ─────
                SizedBox(height: 60),
                SvgPicture.asset(AssetsPath.appLogoMainSvg, width: 80),
                SizedBox(height: 8),
                Text(
                  'BookApp',
                  style: AppTextStyles.headingLarge.copyWith(
                    color: AppColors.themeColor,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 32),
                const Center(
                  child: Text(
                    'Staff Login',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorText,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // ───── Login Widget ─────
                LoginScreenWidget(
                  onTap: () => _handleLogin(context),
                  showSignUp: false,
                ),

                const SizedBox(height: 32),
                Text(
                  textAlign: TextAlign.center,
                  'NB: Tap Login button to see\nSTAFF DASHBOARD!\n Username & Password is not required for KIT',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.red,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
