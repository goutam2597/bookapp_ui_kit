import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/vendors/ui/widgets/vendors_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

/// Screen to display list/grid of vendors.
/// Each vendor card is animated and responsive.
class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 16 * 2 - 8) / 2;

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Vendors'),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Header, search bar and vendor count
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 32),
                        const CustomSearchBarWidget(
                          showFilter: false,
                          hintText: 'Vendor name or location',
                        ),
                        const SizedBox(height: 32),
                        CustomHeaderTextWidget(
                          text: '${dummyServiceCardList.length} Vendors Found',
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
                // Animated vendor cards grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: AnimationLimiter(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(dummyServiceCardList.length, (
                          index,
                        ) {
                          final service = dummyServiceCardList[index];
                          final staff = service.staffs?.isNotEmpty == true
                              ? service.staffs!.first
                              : null;
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: ScaleAnimation(
                              scale: 0.8,
                              child: FadeInAnimation(
                                child: SizedBox(
                                  width: itemWidth,
                                  child: FittedBox(
                                    child: VendorsCardWidget(
                                      showRating: true,
                                      rating: service.rating,
                                      reviews: service.reviewsCount,
                                      showVisitStore: false,
                                      image:
                                          staff?.staffImage ??
                                          AssetsPath.userPlaceholderPng,
                                      name: staff?.staffName ?? 'Unknown',
                                      address: service.address,
                                      serviceQty:
                                          '${service.staffs?.length ?? 0}',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
