import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/screens/login_selection_screen.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/customer/features/account/ui/screens/dashboard_screen.dart';
import 'package:book_app/customer/features/account/ui/screens/edit_profile_screen.dart';
import 'package:book_app/customer/features/auth/ui/screens/reset_password_screen.dart';
import 'package:book_app/customer/features/nav_bar/bottom_nav_bar.dart';
import 'package:book_app/customer/features/orders/ui/screens/orders_screen.dart';
import 'package:book_app/customer/features/wishlist/ui/screens/wishlist_screen.dart';
import 'package:book_app/vendor/features/nav_app_bar/ui/screens/nav_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  List<Map<String, dynamic>> get dashboardItems => [
    {'title': 'Dashboard', 'icon': FontAwesomeIcons.gauge},
    {'title': 'My Profile', 'icon': FontAwesomeIcons.solidUser},
    {'title': 'My Wishlist', 'icon': FontAwesomeIcons.solidHeart},
    {'title': 'Appointments', 'icon': FontAwesomeIcons.solidCalendarCheck},
    {'title': 'Product Orders', 'icon': FontAwesomeIcons.cartShopping},
    {'title': 'Change Password', 'icon': FontAwesomeIcons.lock},
    {'title': 'Login Selection', 'icon': FontAwesomeIcons.store},
    {'title': 'Vendor Dashboard', 'icon': FontAwesomeIcons.gaugeHigh},
    {'title': 'Logout', 'icon': FontAwesomeIcons.rightFromBracket},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Account',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BottomNavBar()),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        'Account Settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildProfileCard(context),
                    const SizedBox(height: 16),
                    _buildDashboardList(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                AssetsPath.staffPng5,
                height: 48,
                width: 48,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'James Rodrigo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorText,
                    ),
                  ),
                  Text(
                    'Customer Account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                );
              },
              child: Container(
                height: 44,
                width: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(
                  AssetsPath.userEdit,
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardList(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dashboardItems.length,
        separatorBuilder: (_, _) =>
            Divider(thickness: 1.5, color: Colors.grey.shade300),
        itemBuilder: (context, index) {
          final item = dashboardItems[index];
          return DashboardItemWidget(
            title: item['title']!,
            svgIcon: item['icon']!,
            onTap: () {
              switch (item['title']) {
                case 'Dashboard':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                case 'My Profile':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                case 'My Wishlist':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const WishlistScreen()),
                  );
                case 'Appointments':
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const BottomNavBar(initialIndex: 2),
                    ),
                    (route) => false,
                  );
                case 'Product Orders':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const OrdersScreen()),
                  );
                case 'Change Password':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ResetPasswordScreen(),
                    ),
                  );
                case 'Login Selection':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginSelectionScreen(),
                    ),
                  );
                case 'Vendor Dashboard':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NavAppBar()),
                  );

                case 'Logout':
                  _showLogoutDialog(context);
              }
            },
          );
        },
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              // Add logout logic
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}

class DashboardItemWidget extends StatelessWidget {
  final String title;
  final IconData svgIcon;
  final VoidCallback onTap;

  const DashboardItemWidget({
    super.key,
    required this.title,
    required this.svgIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Row(
          children: [
            FaIcon(svgIcon, color: Colors.grey.shade600),
            const SizedBox(width: 16),
            Text(
              title,
              style: AppTextStyles.headingSmall.copyWith(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
