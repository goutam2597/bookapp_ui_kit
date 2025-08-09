import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services/ui/screens/services_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';
import '../../../services/ui/widgets/star_rating_widget.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<ServiceCardModel> _wishlistItems = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));

    _wishlistItems.clear();

    for (int i = 0; i < dummyServiceCardList.length; i++) {
      _wishlistItems.add(dummyServiceCardList[i]);
      _listKey.currentState?.insertItem(i);
    }

    setState(() => _isLoading = false);
  }

  Future<void> _removeItem(int index) async {
    if (index < 0 || index >= _wishlistItems.length) {
      return;
    }
    final removedItem = _wishlistItems[index];

    _listKey.currentState?.removeItem(
      index,
          (context, animation) => _buildAnimatedItem(removedItem, animation),
      duration: const Duration(milliseconds: 300),
    );
    _wishlistItems.removeAt(index);

    CustomSnackBar.show(
      snackPosition: SnackPosition.BOTTOM,
      context,
      'Removed from wishlist',
    );
  }

  Widget _buildAnimatedItem(
      ServiceCardModel item,
      Animation<double> animation,
      ) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: _WishlistCard(
        wishlistData: item,
        index: _wishlistItems.indexOf(item),
        onRemove: _removeItem,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'Wishlist'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomSearchBarWidget(
              hintText: 'Search by title',
              showFilter: false,
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _wishlistItems.isEmpty
                ? const Center(child: Text('No items in your wishlist.'))
                : RefreshIndicator(
              onRefresh: _loadWishlist,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _wishlistItems.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index, animation) {
                  return _buildAnimatedItem(
                    _wishlistItems[index],
                    animation,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WishlistCard extends StatelessWidget {
  const _WishlistCard({
    required this.wishlistData,
    required this.index,
    required this.onRemove,
  });

  final ServiceCardModel wishlistData;
  final int index;
  final Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServicesDetailsScreen(product: wishlistData),
            ),
          );
        },
        child: SizedBox(
          height: 104,
          child: Card(
            color: Colors.white,
            elevation: 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            wishlistData.images,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                            const Icon(Icons.broken_image),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                wishlistData.title,
                                style: AppTextStyles.bodyLarge,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height:12),
                              Row(
                                children: [
                                  RatingStarsWidget(
                                    showReviews: false,
                                    rating: wishlistData.rating,
                                    reviews: wishlistData.reviewsCount,
                                  ),
                                  const SizedBox(width: 24),
                                  Text(
                                    '\$${wishlistData.discountedPrice}',
                                    style: AppTextStyles.headingMedium.copyWith(
                                      color: AppColors.themeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 20,
                      child: IconButton(
                        onPressed: () => onRemove(index),
                        icon: const Icon(Icons.delete_rounded, size: 24),
                        color: AppColors.themeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}