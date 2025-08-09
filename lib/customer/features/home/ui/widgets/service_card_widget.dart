import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services/ui/screens/services_details_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/custom_stepper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class ServiceCardWidget extends StatelessWidget {
  final String? categoryFilter;

  const ServiceCardWidget({super.key, this.categoryFilter});

  @override
  Widget build(BuildContext context) {
    final filteredList = categoryFilter == null
        ? dummyServiceCardList
        : dummyServiceCardList
              .where(
                (item) =>
                    item.category.toLowerCase() ==
                    categoryFilter!.toLowerCase().trim(),
              )
              .toList();

    return SizedBox(
      height: 340,
      child: AnimationLimiter(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(right: 16),
          itemCount: filteredList.length,
          itemBuilder: (context, index) {
            final item = filteredList[index];

            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 999),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 8,
                      bottom: 8,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ServicesDetailsScreen(product: item),
                          ),
                        );
                      },
                      child: _buildServiceCard(context, item),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ────── Private: Service Card UI ──────
  Widget _buildServiceCard(BuildContext context, ServiceCardModel item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: 320,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardImage(item.images, context),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildAddressRow(item.address),
                  const SizedBox(height: 8),
                  _buildPriceAndBookButton(context, item),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ────── Private: Card Top Image with Bookmark ──────
  Widget _buildCardImage(String imagePath, BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imagePath,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: InkWell(
            onTap: () {
              CustomSnackBar.show(
                snackPosition: SnackPosition.BOTTOM,
                context,
                'Service Bookmarked',
              );
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.bookmark_border,
                size: 24,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ────── Private: Address with Location Icon ──────
  Widget _buildAddressRow(String address) {
    return Row(
      children: [
        SvgPicture.asset(AssetsPath.markerSvg),
        const SizedBox(width: 4),
        Text(
          address.length > 28 ? '${address.substring(0, 28)}...' : address,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
      ],
    );
  }

  // ────── Private: Price & Booking Button Row ──────
  Widget _buildPriceAndBookButton(BuildContext context, ServiceCardModel item) {
    return Row(
      children: [
        Text(
          item.discountedPrice,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          item.price,
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 120,
          height: 44,
          child: CustomButtonWidget(
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
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
