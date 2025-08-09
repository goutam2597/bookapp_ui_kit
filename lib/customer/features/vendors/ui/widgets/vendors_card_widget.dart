import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/customer/features/services/ui/widgets/star_rating_widget.dart';
import 'package:book_app/customer/features/vendors/ui/screens/vendor_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VendorsCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final String serviceQty;
  final VoidCallback? onVisitStore;
  final bool showVisitStore;
  final String? rating;
  final String? reviews;
  final bool showRating;

  const VendorsCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.address,
    required this.serviceQty,
    this.onVisitStore,
    this.showVisitStore = true,
    this.rating,
    this.reviews,
    this.showRating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VendorDetailsScreen(),
              ),
            );
          },
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 240,
              height: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 44, backgroundImage: NetworkImage(image)),
                  const SizedBox(height: 8),
                  // Vendor Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.titleColor,
                      ),
                    ),
                  ),
                  // Vendor Address
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetsPath.markerSvg,
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            address,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  // Services Qty
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      '$serviceQty Services Available',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Vendor Rating
                  if (showRating)
                    RatingStarsWidget(
                      rating: rating ?? '',
                      reviews: reviews ?? '',
                      showStar: false,
                      showRating: true,
                      showReviews: false,
                      showRatingInP: true,
                      showRatingInNp: false,
                    ),
                ],
              ),
            ),
          ),
        ),
        // "Visit Store" Button (Container style, not visible if showVisitStore is false)
        if (showVisitStore)
          Positioned(
            bottom: 16,
            left: 56,
            right: 56,
            child: GestureDetector(
              onTap: onVisitStore,
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Text(
                    'Visit Store',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
