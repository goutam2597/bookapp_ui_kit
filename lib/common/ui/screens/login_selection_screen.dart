import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/staff/features/auth/ui/screens/staff_login_screen.dart';
import 'package:book_app/vendor/features/auth/ui/screens/vendor_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginSelectionScreen extends StatelessWidget {
  const LoginSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Spacer(),
              SvgPicture.asset(AssetsPath.appLogoMainSvg, width: 120),
              SizedBox(height: 8),
              Text(
                'BookApp',
                style: AppTextStyles.headingLarge.copyWith(
                  color: AppColors.themeColor,
                  fontSize: 32,
                ),
              ),
              Spacer(),
              SizedBox(
                height: 52,
                child: CustomButtonWidget(
                  text: 'Vendor Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VendorLoginScreen(),
                      ),
                    );
                  },
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 52,
                child: CustomButtonWidget(
                  text: 'Staff Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StaffLoginScreen(),
                      ),
                    );
                  },
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
