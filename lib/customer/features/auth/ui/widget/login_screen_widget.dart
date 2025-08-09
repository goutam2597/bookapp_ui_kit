import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:flutter/material.dart'; // Optional logging

/// Reusable login form widget with username/password fields and login button
class LoginScreenWidget extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback? onSignUpTap;
  final bool showSignUp;

  const LoginScreenWidget({
    super.key,
    required this.onTap,
    this.onSignUpTap,
    this.showSignUp = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ───── Username Field ─────
        const FormHeaderTextWidget(text: 'Username*'),
        const SizedBox(height: 4),
        const TextField(), // TODO: Replace with controller for real input
        const SizedBox(height: 24),

        // ───── Password Field ─────
        const FormHeaderTextWidget(text: 'Password*'),
        const SizedBox(height: 4),
        const TextField(obscureText: true),
        const SizedBox(height: 32),

        // ───── Login Button ─────
        SizedBox(
          height: 56,
          child: CustomButtonWidget(
            text: 'Login',
            onPressed: () {
              onTap();
            },
            padding: const EdgeInsets.symmetric(vertical: 16),
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),

        // ───── Sign Up Prompt ─────
        if (showSignUp) _buildSignUpPrompt(),
      ],
    );
  }

  /// Sign up redirection row
  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        TextButton(onPressed: onSignUpTap, child: const Text('Sign Up')),
      ],
    );
  }
}
