import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/ui/widgets/service_card_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/custom_tab_bar_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/service_details_slider_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/star_rating_widget.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/custom_stepper_screen.dart';
import 'package:flutter/material.dart';

class ServicesDetailsScreen extends StatefulWidget {
  final ServiceCardModel product;

  const ServicesDetailsScreen({super.key, required this.product});

  @override
  State<ServicesDetailsScreen> createState() => _ServicesDetailsScreenState();
}

class _ServicesDetailsScreenState extends State<ServicesDetailsScreen> {
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
          // Main scrollable body
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
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(service),
                          const SizedBox(height: 4),
                          Text(
                            service.address,
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(
                                service.discountedPrice,
                                style: AppTextStyles.headingLarge.copyWith(
                                  color: AppColors.themeColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                service.price,
                                style: AppTextStyles.headingMedium.copyWith(
                                  color: Colors.grey.shade500,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          CustomTabBarWidget(
                            description: service.description,
                            features: service.features,
                            address: service.address,
                            phone: service.staffs!.first.staffPhone,
                            email: service.staffs!.first.staffEmail,
                            reviews: service.reviews,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    _buildRelatedServices(itemWidth),
                    const SizedBox(height: 180),
                  ],
                ),
              ),
            ],
          ),

          // Bottom fixed booking section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 180,
                color: Colors.white,
                child: Column(
                  children: [
                    // Staff info section
                    if (widget.product.staffs != null &&
                        widget.product.staffs!.isNotEmpty)
                      Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 32,
                                backgroundImage: NetworkImage(
                                  widget.product.staffs!.first.staffImage ?? '',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.product.staffs!.first.staffName ??
                                          'Not Found',
                                      style: AppTextStyles.headingSmall
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.colorText,
                                          ),
                                    ),
                                    Text(
                                      'Phone: ${widget.product.staffs!.first.staffPhone ?? 'Unavailable'}',
                                      style: AppTextStyles.bodySmall,
                                    ),
                                    Text(
                                      'Email: ${widget.product.staffs!.first.staffEmail ?? 'Unavailable'}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: SizedBox(
                                              height: 732,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Service inquiry',
                                                        style: AppTextStyles
                                                            .headingLarge,
                                                      ),
                                                      CustomIconButtonWidget(
                                                        assetPath: AssetsPath
                                                            .cancelSvg,
                                                        onTap: () {
                                                          Navigator.pop(
                                                            context,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Divider(),
                                                  SizedBox(height: 8),
                                                  CircleAvatar(
                                                    radius: 40,
                                                    backgroundImage:
                                                        NetworkImage(
                                                          widget
                                                                  .product
                                                                  .staffs!
                                                                  .first
                                                                  .staffImage ??
                                                              '',
                                                        ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    widget
                                                            .product
                                                            .staffs!
                                                            .first
                                                            .staffName ??
                                                        '',
                                                    style: AppTextStyles
                                                        .headingMedium,
                                                  ),
                                                  Text(
                                                    widget
                                                            .product
                                                            .staffs!
                                                            .first
                                                            .staffPhone ??
                                                        '',
                                                    style:
                                                        AppTextStyles.bodySmall,
                                                  ),
                                                  Text(
                                                    widget
                                                            .product
                                                            .staffs!
                                                            .first
                                                            .staffEmail ??
                                                        '',
                                                    style:
                                                        AppTextStyles.bodySmall,
                                                  ),
                                                  CustomTextField(
                                                    hintText: 'First name*',
                                                  ),
                                                  CustomTextField(
                                                    hintText: 'Last name*',
                                                  ),
                                                  CustomTextField(
                                                    hintText: 'Email Address*',
                                                  ),
                                                  CustomTextField(
                                                    hintText: 'Message*...',
                                                    maxLine: 5,
                                                  ),
                                                  SizedBox(height: 24),
                                                  SizedBox(
                                                    height: 52,
                                                    child: CustomButtonWidget(
                                                      fontSize: 16,
                                                      text: 'Send Message',
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        CustomSnackBar.show(
                                                          context,
                                                          'Message Sent Successfully!',
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 56,
                                  width: 56,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.email_outlined,
                                    size: 32,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    // Book Now button
                    ElevatedButton(
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
                            builder: (_) =>
                                CustomStepperScreen(selectedService: service),
                          ),
                        );
                      },
                      child: const Text(
                        'Book This Service',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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

  /// App bar with custom back icon and title
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              'Service Details',
              style: AppTextStyles.headingSmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.titleColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomIconButtonWidget(
              assetPath: AssetsPath.backIconSvg,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  /// Service category, rating, and title
  Widget _buildHeader(ServiceCardModel service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              service.category,
              style: AppTextStyles.bodyLarge.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            RatingStarsWidget(
              rating: service.rating,
              reviews: service.reviewsCount,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          service.title,
          style: AppTextStyles.headingSmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.colorText,
          ),
        ),
      ],
    );
  }

  /// Related services below the description
  Widget _buildRelatedServices(double itemWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Related Services',
            style: AppTextStyles.headingSmall.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.colorText,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // ServiceSuggestionGridView(itemWidth: itemWidth),
        ServiceCardWidget(),
      ],
    );
  }
}
