import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/account/ui/widgets/dashboard_summary_card_widget.dart';
import 'package:book_app/staff/features/dashboard/ui/widgets/appointments_log_dialog.dart';
import 'package:book_app/staff/features/staff_appointment/ui/screens/staff_appointment_screen.dart';
import 'package:book_app/staff/features/staff_services/ui/screens/staff_services_screen.dart';
import 'package:flutter/material.dart';

class StaffDashboard extends StatelessWidget {
  const StaffDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderTextWidget(text: 'Welcome back, Lima Johnson!'),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '100',
                  iconSvg: AssetsPath.serviceSvg,
                  cardTitle: 'All\nServices',
                  screen: const StaffServicesScreen(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '123',
                  iconSvg: AssetsPath.totalAppointmentSvg,
                  cardTitle: 'All\nAppointments',
                  screen: const StaffAppointmentsScreen(),
                ),
              ]),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '95',
                  iconSvg: AssetsPath.appointmentsSvg,
                  cardTitle: 'Accepted\nAppointments',
                  screen: const StaffAppointmentsScreen(),
                ),
                _buildSummaryCard(
                  context,
                  qty: '12',
                  iconSvg: AssetsPath.appointmentSvg,
                  cardTitle: 'Pending\nAppointments',
                  screen: const StaffAppointmentsScreen(),
                ),
              ]),
              const SizedBox(height: 12),
              _buildResponsiveRow([
                _buildSummaryCard(
                  context,
                  qty: '02',
                  iconSvg: AssetsPath.totalAppointmentSvg,
                  cardTitle: 'Rejected Appointments',
                  screen: const StaffAppointmentsScreen(),
                ),
              ], spacing: 12),
              const SizedBox(height: 20),
              const CustomHeaderTextWidget(text: 'Recent Appointments'),
              const SizedBox(height: 12),
              _buildRecentAppointmentCards(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Responsive row for dashboard cards
  Widget _buildResponsiveRow(List<Widget> cards, {double spacing = 8}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth =
            (constraints.maxWidth - (spacing * (cards.length - 1))) /
            cards.length;
        double cardHeight = constraints.maxWidth < 400 ? 120 : 120;

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

  /// Only this method is modified for stacked layout
  Widget _buildRecentAppointmentCards(BuildContext context) {
    final appointments = [
      {
        'order': '#68932032c1f6b',
        'title': 'Executive Haircut & Grooming',
        'amount': '30.00',
        'currency': 'NGN',
        'payment': 'Paid',
        'status': 'Pending',
      },
      {
        'order': '#456789abc123',
        'title': 'Home Cleaning Premium',
        'amount': '50.00',
        'currency': 'NGN',
        'payment': 'Paid',
        'status': 'Accepted',
      },
      {
        'order': '#abc987zyx654',
        'title': 'AC Repair Service',
        'amount': '100.00',
        'currency': 'NGN',
        'payment': 'Pending',
        'status': 'Rejected',
      },
    ];

    return Column(
      children: appointments.map((item) {
        return Card(
          color: Colors.white,
          elevation: 0.5,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order: ${item['order']}', style: AppTextStyles.bodyLarge),
                const SizedBox(height: 6),
                Text(
                  item['title']!,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Amount: ${item['amount']} ${item['currency']}',
                  style: AppTextStyles.bodyLargeGrey.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildStatusChip(item['payment']!),
                    const SizedBox(width: 8),
                    _buildStatusChip(item['status']!),
                    const Spacer(),
                    SizedBox(
                      width: 80,
                      height: 32,
                      child: CustomButtonWidget(
                        text: 'Details',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => const AppointmentLogDialog(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  /// Reusable status chip
  Widget _buildStatusChip(String status) {
    final lower = status.toLowerCase();
    final color = (lower == 'pending')
        ? Colors.orange
        : (lower == 'accepted' || lower == 'paid')
        ? Colors.green
        : Colors.red;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
