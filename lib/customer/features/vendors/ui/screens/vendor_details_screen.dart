import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/contact_now_alert_dialog_widget.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/home/ui/widgets/service_card_widget.dart';
import 'package:flutter/material.dart';

/// Vendor Details Screen with category filter, vendor stats, and service list.
/// Design, structure, and layout are unchanged—fully refactored.
class VendorDetailsScreen extends StatefulWidget {
  const VendorDetailsScreen({super.key});

  @override
  State<VendorDetailsScreen> createState() => _VendorDetailsScreenState();
}

class _VendorDetailsScreenState extends State<VendorDetailsScreen> {
  final List<String> categories = [
    'All Services',
    'Education',
    'Plumber',
    'Cleaning',
    'Medical',
    'Automobiles',
  ];

  int selectedIndex = 0;

  // Vendor info for demonstration purposes
  final List<String> labels = [
    'Total Service:',
    'Orders completed:',
    'Address:',
    'Member since:',
  ];
  final List<String> values = [
    '05',
    '10',
    'House no 32, Road 3, sector 11, Uttara, Dhaka, Bangladesh',
    '9th July 2025',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Vendor Details'),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: CustomHeaderTextWidget(text: 'Vendor Services'),
                      ),
                      const SizedBox(height: 16),
                      _buildCategoryChips(),
                      const SizedBox(height: 16),
                      const ServiceCardWidget(),
                      const SizedBox(height: 16),
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: CustomHeaderTextWidget(text: 'Vendor Details'),
                      ),
                      const SizedBox(height: 16),
                      _buildVendorDetailsCard(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Category filter as horizontal chips.
  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 16 : 8),
            child: GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.themeColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Vendor information card with stats and contact button.
  Widget _buildVendorDetailsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          image: const DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/bg_vcard.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 28),
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AssetsPath.staffPng1),
            ),
            const SizedBox(height: 12),
            Text(
              'Abdur Razzak',
              style: AppTextStyles.headingMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                'Our executive chefs use only the freshest, locally sourced ingredients to create seasonal',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            _buildInfoCard(),
          ],
        ),
      ),
    );
  }

  /// Card for vendor stats and contact button.
  Widget _buildInfoCard() {
    return Card(
      margin: EdgeInsets.zero,
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColumnContent(labels, isLabel: true),
                const SizedBox(width: 24),
                _buildColumnContent(values),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: SizedBox(
              height: 50,
              child: CustomButtonWidget(
                fontSize: 18,
                text: 'Contact Now',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ContactNowAlertDialogWidget(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Used for either left (labels) or right (values) column in info card.
  Widget _buildColumnContent(List<String> items, {bool isLabel = false}) {
    return Expanded(
      flex: isLabel ? 3 : 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  item,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: isLabel ? const TextStyle(fontSize: 14) : null,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
