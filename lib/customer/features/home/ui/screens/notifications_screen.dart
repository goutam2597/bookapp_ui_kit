import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final String todayDate = DateFormat('dd MMM, yyyy').format(DateTime.now());
  String? selectedValue = 'All';
  final List<String> items = ['All', 'Read', 'Unread'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Notifications'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  /// Dropdown + Mark All
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 40,
                        child: DropdownButtonFormField<String>(
                          borderRadius: BorderRadius.circular(8),
                          dropdownColor: Colors.white,
                          elevation: 2,
                          value: selectedValue,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          items: items.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        ),
                      ),
                      Text(
                        'Mark All as Read',
                        style: AppTextStyles.bodyLargeGrey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Date Header
                  Text('Today $todayDate', style: AppTextStyles.bodyLargeGrey),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            /// Notifications List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: dummyNotifications.length,
                  itemBuilder: (context, index) {
                    final notifications = dummyNotifications[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade200),
                      ),
                      elevation: 0.5,
                      margin: const EdgeInsets.only(bottom: 12),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Icon
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.grey.shade200,
                              child: SvgPicture.asset(
                                notifications.icon,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(width: 12),

                            /// Text Content
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          notifications.status,
                                          style: AppTextStyles.headingSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        notifications.time,
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text.rich(
                                    TextSpan(
                                      text: '${notifications.title} ',
                                      style: AppTextStyles.bodySmall,
                                      children: [
                                        TextSpan(
                                          text: notifications.subtitle,
                                          style: AppTextStyles.bodySmall
                                              .copyWith(
                                                color: AppColors.themeColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationData {
  final String status;
  final String time;
  final String icon;
  final String title;
  final String subtitle;
  NotificationData({
    required this.title,
    required this.time,
    required this.icon,
    required this.status,
    required this.subtitle,
  });
}

final List<NotificationData> dummyNotifications = [
  NotificationData(
    title: 'Your order is',
    time: '5 min ago',
    icon: AssetsPath.orderHistorySvg,
    status: 'Order Processing',
    subtitle: 'being processed.',
  ),
  NotificationData(
    title: 'Your reservation is',
    time: '10 min ago',
    icon: AssetsPath.reservationSvg,
    status: 'Booking Confirmed',
    subtitle: 'confirmed successfully.',
  ),
  NotificationData(
    title: 'Your payment is',
    time: '12 min ago',
    icon: AssetsPath.sackDollarSvg,
    status: 'Payment Received',
    subtitle: 'completed successfully.',
  ),
  NotificationData(
    title: 'Your order is',
    time: '15 min ago',
    icon: AssetsPath.orderHistorySvg,
    status: 'Order Shipped',
    subtitle: 'on its way.',
  ),
  NotificationData(
    title: 'Your reservation is',
    time: '20 min ago',
    icon: AssetsPath.reservationSvg,
    status: 'Reservation Reminder',
    subtitle: 'scheduled for tomorrow.',
  ),
  NotificationData(
    title: 'Your payment is',
    time: '25 min ago',
    icon: AssetsPath.sackDollarSvg,
    status: 'Invoice Generated',
    subtitle: 'generated.',
  ),
  NotificationData(
    title: 'Your order is',
    time: '30 min ago',
    icon: AssetsPath.orderHistorySvg,
    status: 'Order Delivered',
    subtitle: 'delivered successfully.',
  ),
  NotificationData(
    title: 'Your reservation is',
    time: '35 min ago',
    icon: AssetsPath.reservationSvg,
    status: 'Order Cancelled',
    subtitle: 'cancelled upon request.',
  ),
  NotificationData(
    title: 'Your refund',
    time: '40 min ago',
    icon: AssetsPath.sackDollarSvg,
    status: 'Refund Issued',
    subtitle: 'issued.',
  ),
  NotificationData(
    title: 'Your order is',
    time: '45 min ago',
    icon: AssetsPath.orderHistorySvg,
    status: 'Return Requested',
    subtitle: 'returned.',
  ),
];
