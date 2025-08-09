import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

/// A reusable status/info card widget with flexible info row and chip support.
class StatusInfoCard extends StatelessWidget {
  final String? title;
  final String? provider;
  final String? time;
  final String? date;
  final String? paymentStatus;
  final String? status;
  final String? orderStatus;
  final bool showPaymentStatus;
  final bool showOrderStatus;
  final bool showStatus;
  final bool showTime;
  final bool showProvider;
  final VoidCallback onTap;
  final String? qty;
  final String? price;
  final String? totalPrice;
  final bool showQty;
  final bool showPrice;
  final bool showTotalPrice;
  final bool showDate;

  const StatusInfoCard({
    super.key,
    this.title,
    this.provider,
    this.time,
    this.date,
    this.paymentStatus,
    this.orderStatus,
    this.status,
    this.showPaymentStatus = false,
    this.showOrderStatus = false,
    this.showStatus = false,
    this.showTime = false,
    this.showProvider = false,
    required this.onTap,
    this.price,
    this.totalPrice,
    this.qty,
    this.showPrice = false,
    this.showTotalPrice = false,
    this.showQty = false,
    this.showDate = true,
  });

  // Status chip background color based on value
  Color _statusBgColor(String? value) {
    switch (value) {
      case 'Confirmed':
      case 'Accepted':
      case 'Completed':
        return Colors.green.shade100;
      case 'Cancelled':
      case 'Rejected':
        return Colors.red.shade100;
      case 'Pending':
      default:
        return Colors.orange.shade100;
    }
  }

  // Status chip text color based on value
  Color _statusTextColor(String? value) {
    switch (value) {
      case 'Confirmed':
      case 'Accepted':
      case 'Completed':
        return Colors.green;
      case 'Cancelled':
      case 'Rejected':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.orange;
    }
  }

  /// Status/payment/order chips
  Widget _statusContainer(String value) {
    return Container(
      alignment: Alignment.center,
      height: 28,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: _statusBgColor(value),
      ),
      child: Text(
        value,
        style: TextStyle(
          color: _statusTextColor(value),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Key-value text style for info rows
  Widget _infoText(String text) => Text(
    text,
    style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500),
  );

  /// Payment row label + value
  Widget _labelValue(String label, String? value) => Row(
    children: [
      Text(
        '$label:',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(width: 4),
      _infoText(value ?? 'N/A'),
    ],
  );

  /// Payment row label + chip
  Widget _labelChip(String label, String? value) => Row(
    children: [
      Text(
        '$label:',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      const SizedBox(width: 4),
      _statusContainer(value ?? ''),
    ],
  );

  /// Vertical divider between row items
  Widget _vDivider() => SizedBox(
    height: 16,
    child: VerticalDivider(
      thickness: 1.5,
      color: Colors.grey.shade600,
      width: 10,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Build info row items (order preserved, only visible if flag set)
    final List<Widget> rowItems = [];

    if (showProvider) rowItems.add(_infoText(provider ?? 'Unknown'));
    if (showTime) rowItems.add(_infoText(time ?? 'Not Available'));
    if (showDate) rowItems.add(_infoText(date ?? 'Not Available'));

    if (showStatus) rowItems.add(_statusContainer(status ?? ''));

    // Three payment-related info: qty, price, total price
    if (showQty) rowItems.add(_labelValue('Quantity', qty));
    if (showPrice) rowItems.add(_labelValue('Price', price));
    if (showTotalPrice) rowItems.add(_labelValue('Total', totalPrice));

    // Payment and Order status chips (with label)
    if (showPaymentStatus) rowItems.add(_labelChip('Payment', paymentStatus));
    if (showOrderStatus) rowItems.add(_labelChip('Order', orderStatus));

    // Add vertical dividers between visible items only
    final List<Widget> withDividers = [];
    for (int i = 0; i < rowItems.length; i++) {
      if (i > 0) withDividers.add(_vDivider());
      withDividers.add(rowItems[i]);
    }

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Card(
        color: Colors.grey.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FittedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.colorText,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(children: withDividers),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
