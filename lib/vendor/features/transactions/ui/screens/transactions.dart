import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/common/ui/widgets/information_card_widget.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> transactionList = [
      {
        'Transaction Id:': '#6878d8afb1db5',
        'Transaction Type:': 'Withdraw',
        'Payment Method:': 'My bank',
        'Pre Balance:': '\$910.00',
        'Amount:': '(-) \$50.00',
        'After Balance:': '\$860.00',
        'Status:': 'Unpaid',
      },
      {
        'Transaction Id:': '#a73b5ee947d2c',
        'Transaction Type:': 'Deposit',
        'Payment Method:': 'bKash',
        'Pre Balance:': '\$860.00',
        'Amount:': '(+) \$100.00',
        'After Balance:': '\$960.00',
        'Status:': 'Paid',
      },
      {
        'Transaction Id:': '#c49877b0da4f2',
        'Transaction Type:': 'Withdraw',
        'Payment Method:': 'Rocket',
        'Pre Balance:': '\$960.00',
        'Amount:': '(-) \$30.00',
        'After Balance:': '\$930.00',
        'Status:': 'Pending',
      },
      {
        'Transaction Id:': '#d5e3a12876cc9',
        'Transaction Type:': 'Deposit',
        'Payment Method:': 'Nagad',
        'Pre Balance:': '\$930.00',
        'Amount:': '(+) \$200.00',
        'After Balance:': '\$1130.00',
        'Status:': 'Paid',
      },
      {
        'Transaction Id:': '#e91dcbf362110',
        'Transaction Type:': 'Withdraw',
        'Payment Method:': 'My bank',
        'Pre Balance:': '\$1130.00',
        'Amount:': '(-) \$80.00',
        'After Balance:': '\$1050.00',
        'Status:': 'Unpaid',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Transactions'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CustomSearchBarWidget(
                    hintText: 'Enter Transaction Id',
                    showFilter: false,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: transactionList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final transaction = transactionList[index];
                        return InformationCardWidget(
                          cardTitle: 'Transaction #${index + 1}',
                          infoEntries: transaction.entries.toList(),
                        );
                      },
                    ),
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
