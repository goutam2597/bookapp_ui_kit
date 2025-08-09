import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services/ui/widgets/custom_tab_bar_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/quantity_selector_stepper_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/service_details_slider_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/service_suggestion_grid_view.dart';
import 'package:book_app/customer/features/services/ui/widgets/star_rating_widget.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/custom_stepper_screen.dart';
import 'package:flutter/material.dart';

class ServicesDetailsScreenV2 extends StatefulWidget {
  final ServiceCardModel product;

  const ServicesDetailsScreenV2({super.key, required this.product});

  @override
  State<ServicesDetailsScreenV2> createState() =>
      _ServicesDetailsScreenV2State();
}

class _ServicesDetailsScreenV2State extends State<ServicesDetailsScreenV2> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.product;
    final imgList = service.sliderImages ?? [];
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 32 - 8) / 2;

    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // ───── Scrollable Service Details Content ─────
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    ImageCarousel(
                      imgList: imgList,
                      selectedIndex: _selectedIndex,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(service),
                          const SizedBox(height: 8),
                          RatingStarsWidget(
                            rating: service.rating,
                            reviews: service.reviewsCount,
                          ),
                          const SizedBox(height: 16),
                          CustomTabBarWidget(description: service.description),
                          const SizedBox(height: 16),
                          _buildRelatedServices(itemWidth),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ───── Bottom Booking Bar ─────
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: SafeArea(
              bottom: false,
              child: Container(
                height: 90,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: QuantitySelectorStepperWidget(),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 7,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CustomStepperScreen(selectedService: service),
                            ),
                          );
                        },
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ───── Custom AppBar with search and cart ─────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CustomIconButtonWidget(
                assetPath: AssetsPath.backIconSvg,
                onTap: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              flex: 7,
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 40,
              width: 40,
              child: CustomIconButtonWidget(assetPath: AssetsPath.cartSvg, onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }

  // ───── Header Section with Category, Title, and Price ─────
  Widget _buildHeader(ServiceCardModel service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              service.category,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,
              ),
            ),
            const Spacer(),
            Text(
              service.discountedPrice,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.themeColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              service.price,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          service.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.colorText,
          ),
        ),
      ],
    );
  }

  // ───── Related Services Section ─────
  Widget _buildRelatedServices(double itemWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Related Services',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.colorText,
          ),
        ),
        const SizedBox(height: 8),
        ServiceSuggestionGridView(itemWidth: itemWidth),
      ],
    );
  }
}
