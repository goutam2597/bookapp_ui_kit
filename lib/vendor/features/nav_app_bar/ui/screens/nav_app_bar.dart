import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/vendor/features/dashboard/ui/screens/vendor_dashboard_screen.dart';
import 'package:book_app/vendor/features/nav_app_bar/ui/widgets/vendor_drawer_widget.dart';
import 'package:flutter/material.dart';

class NavAppBar extends StatefulWidget {
  final int initialIndex;
  const NavAppBar({super.key, this.initialIndex = 0});

  @override
  State<NavAppBar> createState() => _NavAppBarState();
}

class _NavAppBarState extends State<NavAppBar> {
  late int _selectedIndex;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;

    _screens = const [VendorDashboardScreen()];
  }

  void changeScreen(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: VendorDrawerWidget(onSelectScreen: changeScreen),
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
