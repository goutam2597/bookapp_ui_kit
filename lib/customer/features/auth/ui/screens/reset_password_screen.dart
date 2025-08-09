import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Screen for resetting a user's password
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: ''),

          // ───── Scrollable Form Section ─────
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),

                    // ───── Logo ─────
                    Align(
                      child: SvgPicture.asset(
                        AssetsPath.appLogoSvg,
                        width: 160,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ───── Instruction Text ─────
                    const Align(
                      child: Text(
                        'Let’s create new password for your account.',
                        style: AppTextStyles.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ───── New Password Field ─────
                    const FormHeaderTextWidget(text: 'New password'),
                    const SizedBox(height: 4),
                    const TextField(),

                    const SizedBox(height: 16),

                    // ───── Confirm Password Field ─────
                    const FormHeaderTextWidget(
                      text: 'Confirm your new password*',
                    ),
                    const SizedBox(height: 4),
                    const TextField(),

                    const SizedBox(height: 32),

                    // ───── Submit Button ─────
                    SizedBox(
                      height: 52,
                      child: CustomButtonWidget(
                        fontSize: 18,
                        text: 'Submit new password',
                        onPressed: () {
                          // TODO: Add reset password logic
                        },
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
