import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/common/ui/widgets/status_info_card.dart';
import 'package:book_app/customer/features/account/models/orders_model.dart';
import 'package:book_app/customer/features/orders/ui/screens/order_details_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Product Order'),

          // ───── Fixed Header and Search ─────
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBarWidget(
                  showFilter: false,
                  hintText: 'Search by order number/Product Name',
                ),
                SizedBox(height: 16),
                CustomHeaderTextWidget(text: 'Product Orders History'),
              ],
            ),
          ),

          // ───── Scrollable List Only ─────
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final ordersData = orders[index];
                return StatusInfoCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDetailsScreen(),
                      ),
                    );
                  },
                  title: ordersData.title,
                  date: ordersData.date,
                  paymentStatus: ordersData.paymentStatus,
                  orderStatus: ordersData.orderStatus,
                  showOrderStatus: true,
                  showPaymentStatus: true,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
