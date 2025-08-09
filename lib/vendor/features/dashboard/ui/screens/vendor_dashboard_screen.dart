import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/account/ui/widgets/dashboard_summary_card_widget.dart';
import 'package:book_app/customer/features/account/ui/widgets/income_chart_widget.dart';
import 'package:book_app/vendor/features/appointments/ui/screens/vendor_appointments_screen.dart';
import 'package:book_app/vendor/features/services/ui/screens/vendor_services_screen.dart';
import 'package:book_app/vendor/features/subscription_log/ui/screens/subscription_log_screen.dart';
import 'package:book_app/vendor/features/support_tickets/ui/screens/all_tickets.dart';
import 'package:book_app/vendor/features/withdrawal/ui/screens/my_balance.dart';
import 'package:flutter/material.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderTextWidget(text: 'Welcome back, tomhughes!'),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '\$99',
                  iconSvg: AssetsPath.sackDollarSvg,
                  cardTitle: 'My\nbalance',
                  screen: const MyBalance(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '100',
                  iconSvg: AssetsPath.serviceSvg,
                  cardTitle: 'All\nServices',
                  screen: const VendorServicesScreen(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '123',
                  iconSvg: AssetsPath.totalAppointmentSvg,
                  cardTitle: 'All\nAppointments',
                  screen: const VendorAppointmentsScreen(),
                ),
              ]),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '000',
                  iconSvg: AssetsPath.totalAppointmentSvg,
                  cardTitle: 'Pending\nAppointments',
                  screen: const VendorAppointmentsScreen(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '000',
                  iconSvg: AssetsPath.appointmentsSvg,
                  cardTitle: 'Accepted\nAppointments',
                  screen: const VendorAppointmentsScreen(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '000',
                  iconSvg: AssetsPath.appointmentSvg,
                  cardTitle: 'Rejected\nAppointments',
                  screen: const VendorAppointmentsScreen(),
                ),
              ]),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '02',
                  iconSvg: AssetsPath.totalAppointmentSvg,
                  cardTitle: 'All Support\nTickets',
                  screen: const AllTickets(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '20',
                  iconSvg: AssetsPath.appointmentsSvg,
                  cardTitle: 'Subscription\nLog',
                  screen: const SubscriptionLogScreen(),
                ),
              ], spacing: 12),
              const SizedBox(height: 16),
              const CustomHeaderTextWidget(text: 'Monthly Income (2025)'),
              const SizedBox(height: 20),
              const IncomeChartWidget(),
              const SizedBox(height: 16),
              const CustomHeaderTextWidget(text: 'Monthly Appointments (2025)'),
              const SizedBox(height: 20),
              const IncomeChartWidget(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a responsive row of widgets with a consistent layout and dynamic height.
  Widget _buildResponsiveRow(List<Widget> cards, {double spacing = 8}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate the width for each card to maintain the layout and aspect ratio.
        double cardWidth =
            (constraints.maxWidth - (spacing * (cards.length - 1))) /
            cards.length;

        // Set card height based on screen width.
        double cardHeight = constraints.maxWidth < 400 ? 100 : 120;

        return Row(
          children: List.generate(cards.length * 2 - 1, (index) {
            if (index.isEven) {
              return SizedBox(
                height: cardHeight,
                width: cardWidth,
                child: cards[index ~/ 2],
              );
            }
            return SizedBox(width: spacing);
          }),
        );
      },
    );
  }

  /// Builds a reusable DashboardSummaryCardWidget with navigation logic.
  DashboardSummaryCardWidget _buildSummaryCard(
    BuildContext context, {
    required String qty,
    required String iconSvg,
    required String cardTitle,
    required Widget screen,
  }) {
    return DashboardSummaryCardWidget(
      fontSize: 24,
      qty: qty,
      iconSvg: iconSvg,
      cardTitle: cardTitle,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }
}
