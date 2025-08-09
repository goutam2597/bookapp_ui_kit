import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:book_app/customer/features/account/ui/widgets/dashboard_summary_card_widget.dart';
import 'package:book_app/customer/features/nav_bar/bottom_nav_bar.dart';
import 'package:book_app/customer/features/orders/ui/screens/orders_screen.dart';
import 'package:book_app/customer/features/wishlist/ui/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

/// Displays summary cards and account information for the user
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ───── Top App Bar ─────
          const CustomAppBar(title: 'Dashboard'),

          // ───── Main Scrollable Content ─────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // ───── Dashboard Summary Cards ─────
                  Row(
                    children: [
                      Expanded(
                        child: DashboardSummaryCardWidget(
                          iconSvg: AssetsPath.totalAppointmentSvg,
                          qty: '150',
                          cardTitle: 'Total\nAppointments',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const BottomNavBar(initialIndex: 2),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: DashboardSummaryCardWidget(
                          iconSvg: AssetsPath.totalAppointmentSvg,
                          qty: '32',
                          cardTitle: 'Total\nProduct Orders',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const OrdersScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: DashboardSummaryCardWidget(
                      iconSvg: AssetsPath.totalAppointmentSvg,
                      qty: '87',
                      cardTitle: 'Total Wishlist Items',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WishlistScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ───── User Information ─────
                  const InformationCardWidget(
                    cardTitle: 'Account Information',
                    infoEntries: [
                      MapEntry('Username:', 'James Rodri'),
                      MapEntry('Name:', 'James Rodrigo Mular'),
                      MapEntry('Email Address:', 'user@example.com'),
                      MapEntry('Phone:', '+1 (195) 312-1866'),
                      MapEntry('City:', 'Toronto'),
                      MapEntry('Zip Code:', '882569'),
                      MapEntry(
                        'Address:',
                        '123 Queen Street West,\nToronto, Ontario, M5V 3L9,\nCanada',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
