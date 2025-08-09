import 'package:book_app/app/assets_path.dart';
import 'package:book_app/staff/features/common_widgets/reusable_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/vendor_appointment_details_screen.dart';

class AppointmentsCardWidget extends StatelessWidget {
  final Map<String, String> booking;
  final List<String> orderItems;
  final List<String> actionItems;
  final String? selectedOrder;
  final String? selectedAction;
  final ValueChanged<String?> onOrderChanged;
  final ValueChanged<String?> onActionChanged;
  final bool showAction;
  final bool showOrder;

  const AppointmentsCardWidget({
    super.key,
    required this.booking,
    required this.orderItems,
    required this.actionItems,
    required this.selectedOrder,
    required this.selectedAction,
    required this.onOrderChanged,
    required this.onActionChanged,
    this.showAction = true,
    this.showOrder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  VendorAppointmentDetailsScreen(booking: booking),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Booking ID, Date, Price
              Row(
                children: [
                  SvgPicture.asset(AssetsPath.idSvg),
                  const SizedBox(width: 4),
                  Text('Id: ${booking['id']}'),
                  const SizedBox(width: 16),
                  SvgPicture.asset(AssetsPath.daySvg),
                  const SizedBox(width: 4),
                  Text(booking['date']!),
                  const SizedBox(width: 16),
                  SvgPicture.asset(AssetsPath.dollarsSvg),
                  const SizedBox(width: 4),
                  Text(booking['price']!),
                ],
              ),
              const SizedBox(height: 8),
              // Title
              Row(
                children: [
                  SvgPicture.asset(AssetsPath.pollSvg),
                  const SizedBox(width: 4),
                  Expanded(child: Text('Title: ${booking['title']}')),
                ],
              ),
              const SizedBox(height: 8),
              // Customer + Payment
              FittedBox(
                child: Row(
                  children: [
                    SvgPicture.asset(AssetsPath.upSvg),
                    const SizedBox(width: 4),
                    Text(booking['customer']!),
                    const SizedBox(width: 16),
                    SvgPicture.asset(AssetsPath.walletSvg),
                    const SizedBox(width: 4),
                    const Text('Payment: '),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.greenAccent,
                      ),
                      child: Text(booking['paymentStatus']!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Order + Refund
              FittedBox(
                child: Row(
                  children: [
                    if (showOrder) SvgPicture.asset(AssetsPath.ordersSvg),
                    if (showOrder) const SizedBox(width: 4),
                    if (showOrder) const Text('Order'),
                    if (showOrder) const SizedBox(width: 8),
                    if (showOrder)
                      ReusableDropdownWidget(
                        title: 'Order',
                        selectedValue: selectedOrder,
                        items: orderItems,
                        onChanged: onOrderChanged,
                      ),
                    if (showOrder) const SizedBox(width: 12),
                    SvgPicture.asset(AssetsPath.dollarsSvg),
                    const SizedBox(width: 4),
                    const Text('Refund: '),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange,
                      ),
                      child: Text(booking['paymentStatus']!),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),
              // Action
              if (showAction)
                Row(
                  children: [
                    SvgPicture.asset(AssetsPath.filterSvg),
                    const SizedBox(width: 4),
                    const Text('Action'),
                    const SizedBox(width: 8),
                    ReusableDropdownWidget(
                      title: 'Action',
                      selectedValue: selectedAction,
                      items: actionItems,
                      onChanged: onActionChanged,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
