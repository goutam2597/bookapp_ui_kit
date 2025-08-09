import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/vendor/features/subscription_log/ui/widgets/subscription_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscriptionCardWidget extends StatelessWidget {
  final Map<String, String> sub;

  const SubscriptionCardWidget({super.key, required this.sub});

  @override
  Widget build(BuildContext context) {
    final status = sub['paymentStatus'] ?? '';
    final statusColor = status == 'Success' ? Colors.green : Colors.red;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRowWithIcon(
              iconPath: AssetsPath.idSvg,
              text: 'Transaction Id: ${sub['id']}',
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(AssetsPath.dollarsSvg, width: 16, height: 16),
                const SizedBox(width: 6),
                Text(sub['price'] ?? '', style: AppTextStyles.bodySmall),
                const SizedBox(width: 16),
                SvgPicture.asset(AssetsPath.daySvg, width: 16, height: 16),
                const SizedBox(width: 6),
                Text('Payment:', style: AppTextStyles.bodySmall),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    status,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            FittedBox(
              child: Row(
                children: [
                  SvgPicture.asset(AssetsPath.walletSvg, width: 16, height: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Method: ${sub['paymentMethod']}',
                    style: AppTextStyles.bodySmall,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(AssetsPath.filterSvg, width: 16, height: 16),
                  const SizedBox(width: 4),
                  const Text('Action', style: TextStyle(fontSize: 13)),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 72,
                    height: 28,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => const SubscriptionDetailsDialog(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowWithIcon({required String iconPath, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(iconPath, width: 16, height: 16),
        const SizedBox(width: 6),
        Text(text, style: AppTextStyles.bodySmall),
      ],
    );
  }
}
