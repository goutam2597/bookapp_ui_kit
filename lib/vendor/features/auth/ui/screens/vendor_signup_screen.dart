import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Vendor Login Screen
class VendorSignupScreen extends StatelessWidget {
  const VendorSignupScreen({super.key});

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
                SizedBox(height: 50),
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
                    'Vendor Signup',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.colorText,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(hintText: 'Username', headerText: 'Username*'),
                const SizedBox(height: 16),
                CustomTextField(hintText: 'Email', headerText: 'Email*'),
                const SizedBox(height: 16),
                CustomTextField(hintText: 'Password', headerText: 'Password*'),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Confirm Password',
                  headerText: 'Confirm Password*',
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 52,
                  child: CustomButtonWidget(
                    text: 'Sign Up',
                    onPressed: () {},
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Login Now'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
