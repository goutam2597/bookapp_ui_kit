import 'package:book_app/app/app_colors.dart';
import 'package:book_app/customer/features/auth/ui/widget/login_screen_widget.dart';
import 'package:flutter/material.dart';

/// Screen for user login
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ───── Title Text ─────
              const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorText,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ───── Login Form Widget ─────
              LoginScreenWidget(onTap: () {}, onSignUpTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
