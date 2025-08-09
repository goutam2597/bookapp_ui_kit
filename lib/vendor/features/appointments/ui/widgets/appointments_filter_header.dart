import 'package:book_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppointmentsFilterHeader extends StatelessWidget {
  final TextEditingController searchController;
  final List<String> paymentOptions;
  final String selectedPayment;
  final ValueChanged<String> onPaymentChanged;

  final List<String> orderOptions;
  final String selectedOrder;
  final ValueChanged<String> onOrderChanged;

  final List<String> refundedOptions;
  final String selectedRefunded;
  final ValueChanged<String> onRefundChanged;

  const AppointmentsFilterHeader({
    super.key,
    required this.searchController,
    required this.paymentOptions,
    required this.selectedPayment,
    required this.onPaymentChanged,
    required this.orderOptions,
    required this.selectedOrder,
    required this.onOrderChanged,
    required this.refundedOptions,
    required this.selectedRefunded,
    required this.onRefundChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search + Payment
        Row(
          children: [
            Expanded(child: _buildSearchField()),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdown(
                'Payment',
                paymentOptions,
                selectedPayment,
                onPaymentChanged,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Order + Refunded
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                'Order',
                orderOptions,
                selectedOrder,
                onOrderChanged,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildDropdown(
                'Refunded',
                refundedOptions,
                selectedRefunded,
                onRefundChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Booking ID', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search Here',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                AssetsPath.searchIconSvg,
                width: 16,
                height: 16,
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String selected,
    ValueChanged<String> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          borderRadius: BorderRadius.circular(12),
          dropdownColor: Colors.white,
          value: selected,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) => onChanged(val!),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }
}
