import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/customer/features/account/ui/screens/account_screen.dart';
import 'package:book_app/customer/features/appointments/ui/screens/appointments_screen.dart';
import 'package:book_app/customer/features/home/ui/screens/home_screen.dart';
import 'package:book_app/customer/features/services/ui/screens/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;
  late final List<Widget> _navBarScreens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _navBarScreens = const [
      HomeScreen(),
      ServicesScreen(),
      AppointmentsScreen(),
      AccountScreen(),
    ];
  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _navBarScreens),
      bottomNavigationBar: Container(
        height: 84,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          children: [
            _buildNavItem(0, 'Home', AssetsPath.homeSvg),
            _buildNavItem(1, 'Services', AssetsPath.serviceSvg),
            _buildNavItem(2, 'Appointment', AssetsPath.appointmentSvg),
            _buildNavItem(3, 'Account', AssetsPath.accountSvg),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, String iconPath) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? AppColors.themeColor : Colors.grey.shade800;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onTappedItem(index),
          borderRadius: BorderRadius.circular(99),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: 32,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: color,
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
