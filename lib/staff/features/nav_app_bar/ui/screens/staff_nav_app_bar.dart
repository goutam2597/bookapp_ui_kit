import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/staff/features/dashboard/ui/screens/staff_dashboard.dart';
import 'package:book_app/staff/features/nav_app_bar/ui/widgets/staff_drawer_widget.dart';
import 'package:flutter/material.dart';

class StaffNavAppBar extends StatefulWidget {
  final int initialIndex;
  const StaffNavAppBar({super.key, this.initialIndex = 0});

  @override
  State<StaffNavAppBar> createState() => _StaffNavAppBarState();
}

class _StaffNavAppBarState extends State<StaffNavAppBar> {
  late int _selectedIndex;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    _screens = const [StaffDashboard()];
  }

  void changeScreen(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StaffDrawerWidget(onScreenSelect: changeScreen),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(
          builder: (context) {
            return CustomAppBar(
              showThemeBtn: true,
              showLogo: true,
              showTitle: false,
              title: AssetsPath.appLogoSvg,
              onTap: () => Scaffold.of(context).openDrawer(),
              icon: AssetsPath.menuIconSvg,
              showLanguageBtn: true,
            );
          },
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
    );
  }
}
