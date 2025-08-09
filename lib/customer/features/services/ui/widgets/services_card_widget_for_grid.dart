import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services/ui/screens/services_details_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/custom_stepper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class ServicesCardWidgetForGrid extends StatelessWidget {
  final ServiceCardModel item;
  const ServicesCardWidgetForGrid({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    final cardWidth = isTablet
        ? (screenWidth / 5) - 32
        : (screenWidth / 2) - 24;
    final imageHeight = isTablet ? 160.0 : 140.0;
    final padding = isTablet ? 12.0 : 8.0;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _navigateToDetails(context),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: cardWidth,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageWithBookmark(imageHeight, context),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCategoryText(isTablet, screenWidth),
                    const SizedBox(height: 4),
                    _buildTitleText(isTablet),
                    const SizedBox(height: 4),
                    _buildLocationRow(isTablet),
                    const SizedBox(height: 4),
                    _buildPriceAndButton(context, isTablet),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigate to service details screen
  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServicesDetailsScreen(product: item),
      ),
    );
  }

  /// Build image with top-right bookmark icon
  Widget _buildImageWithBookmark(double height, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.images,
            height: height,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: InkWell(
            onTap: () {
              CustomSnackBar.show(
                snackPosition: SnackPosition.BOTTOM,
                context,
                'Service Bookmarked',
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.bookmark_border,
                size: 20,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Build category + price row
  Widget _buildCategoryText(bool isTablet, double screenWidth) {
    final showOriginalPrice = screenWidth > 360;

    return Row(
      children: [
        Text(
          item.category,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: isTablet ? 13 : 12,
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              item.discountedPrice,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 4),
            if (showOriginalPrice)
              Text(
                item.price,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ],
    );
  }

  /// Build title text
  Widget _buildTitleText(bool isTablet) {
    return Text(
      item.title,
      style: TextStyle(
        fontSize: isTablet ? 15 : 14,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Build location row with marker icon
  Widget _buildLocationRow(bool isTablet) {
    return Row(
      children: [
        SvgPicture.asset(AssetsPath.markerSvg, height: 12, width: 12),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            item.address.length > 30
                ? '${item.address.substring(0, 30)}...'
                : item.address,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: isTablet ? 13 : 12,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// Build Book Now button
  Widget _buildPriceAndButton(BuildContext context, bool isTablet) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          height: 32,
          child: CustomButtonWidget(
            fontSize: 16,
            text: 'Book Now',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CustomStepperScreen(selectedService: item),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
