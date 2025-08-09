import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/vendor/features/subscription_log/ui/widgets/subscription_card_widget.dart';
import 'package:flutter/material.dart';

class SubscriptionLogScreen extends StatelessWidget {
  const SubscriptionLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subscriptions = [
      {
        'id': '6720765b55b37',
        'price': '\$999',
        'paymentMethod': 'Paytm',
        'paymentStatus': 'Success',
      },
      {
        'id': '9876543abcd12',
        'price': '\$499',
        'paymentMethod': 'Credit Card',
        'paymentStatus': 'Success',
      },
      {
        'id': '1234567xyz890',
        'price': '\$499',
        'paymentMethod': 'Credit Card',
        'paymentStatus': 'Failed',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Subscription Log'),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomSearchBarWidget(
                  showFilter: false,
                  hintText: 'Search by Transaction ID',
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: subscriptions.length,
              itemBuilder: (_, index) =>
                  SubscriptionCardWidget(sub: subscriptions[index]),
            ),
          ),
        ],
      ),
    );
  }
}
