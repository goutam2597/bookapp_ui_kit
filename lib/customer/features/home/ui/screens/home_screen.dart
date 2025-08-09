import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/customer/features/cart/ui/screens/cart_screen.dart';
import 'package:book_app/customer/features/home/data/models/category_list_model.dart';
import 'package:book_app/customer/features/home/ui/screens/notifications_screen.dart';
import 'package:book_app/customer/features/home/ui/widgets/category_list_widget.dart';
import 'package:book_app/customer/features/home/ui/widgets/home_screen_header_widget.dart';
import 'package:book_app/customer/features/home/ui/widgets/home_vendor_list_view.dart';
import 'package:book_app/customer/features/home/ui/widgets/service_card_widget.dart';
import 'package:book_app/customer/features/home/ui/widgets/text_n_button_widget.dart';
import 'package:book_app/customer/features/nav_bar/bottom_nav_bar.dart';
import 'package:book_app/customer/features/vendors/ui/screens/vendors_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';
import '../../../../../common/ui/widgets/dropdown_alert_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int cartItemsCount = 0;
  int selectedCategoryIndex = 0;

  final List<String> languages = ['English', 'Arabic', 'Spanish'];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final horizontalPadding = isTablet ? 24.0 : 16.0;
        final sectionHeight = isTablet ? 380.0 : 332.0;
        final categoryHeight = isTablet ? 130.0 : 100.0;
        final vendorHeight = isTablet ? 340.0 : 300.0;
        final logoWidth = isTablet ? 150.0 : 125.0;

        return Scaffold(
          floatingActionButton: _buildCartFAB(context),
          appBar: _buildAppBar(context, logoWidth),
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(child: _buildHeader(horizontalPadding)),
              SliverToBoxAdapter(
                child: _buildServiceCategory(horizontalPadding, categoryHeight),
              ),
              SliverToBoxAdapter(
                child: _buildFeaturedService(
                  horizontalPadding,
                  sectionHeight,
                  context,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildTopFeaturedVendors(
                  context,
                  horizontalPadding,
                  vendorHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: _buildMostPopularServices(horizontalPadding, context),
              ),
              SliverToBoxAdapter(child: _buildHorizontalCategoryButtons()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: sectionHeight,
                  child: ServiceCardWidget(
                    categoryFilter: selectedCategoryIndex == 0
                        ? null
                        : dummyCategoryList[selectedCategoryIndex - 1].title,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(BuildContext context, double logoWidth) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AssetsPath.appLogoSvg,
              height: 24,
              width: logoWidth,
            ),
            Row(
              children: [
                CustomIconButtonWidget(
                  assetPath: AssetsPath.notificationIconSvg,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationsScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                CustomIconButtonWidget(
                  assetPath: AssetsPath.languageSvg,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => DropdownAlertDialog(
                        dialogType: DialogType.dropdown,
                        drpDownTitle: 'Select Language',
                        title: 'Select Language',
                        btnTitle: 'Save',
                        items: languages,
                        onConfirm: (selectedValue) {
                          if (selectedValue != null) {
                            return CustomSnackBar.show(
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.themeColor,
                              context,
                              '$selectedValue is Selected Now',
                            );
                          }else {
                            return CustomSnackBar.show(
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.themeColorTwo,
                              context,
                              'English is The Default Language',
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget? _buildCartFAB(BuildContext context) {
    if (cartItemsCount == 0) return null;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        FloatingActionButton(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.themeColor),
            borderRadius: BorderRadius.circular(99),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          child: const Icon(
            Icons.shopping_cart_rounded,
            color: AppColors.themeColor,
          ),
        ),
        Positioned(
          right: -8,
          child: Container(
            alignment: Alignment.center,
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              cartItemsCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: const HomeScreenHeaderWidget(),
    );
  }

  Widget _buildServiceCategory(double padding, double height) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          child: TextNButtonWidget(title: 'Service Category', onTap: () {}),
        ),
        SizedBox(height: height, child: const CategoryListWidget()),
      ],
    );
  }

  Widget _buildFeaturedService(
    double padding,
    double height,
    BuildContext context,
  ) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          child: TextNButtonWidget(
            title: 'Featured Service',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BottomNavBar(initialIndex: 1),
                ),
              );
            },
          ),
        ),
        SizedBox(height: height, child: const ServiceCardWidget()),
      ],
    );
  }

  Widget _buildTopFeaturedVendors(
    BuildContext context,
    double padding,
    double height,
  ) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
          child: TextNButtonWidget(
            title: 'Top Vendors',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VendorsScreen()),
              );
            },
          ),
        ),
        SizedBox(height: height, child: const HomeVendorCardListView()),
      ],
    );
  }

  Widget _buildMostPopularServices(double padding, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 8),
      child: TextNButtonWidget(
        title: 'Most Popular Services',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(initialIndex: 1),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHorizontalCategoryButtons() {
    final List<String> categoriesWithAll = [
      'All',
      ...dummyCategoryList.map((e) => e.title),
    ];

    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesWithAll.length,
        itemBuilder: (context, index) {
          final title = categoriesWithAll[index];
          final isSelected = selectedCategoryIndex == index;

          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 16 : 8, bottom: 3),
            child: SizedBox(
              height: 48,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: isSelected
                      ? AppColors.themeColor
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isSelected
                          ? AppColors.themeColor
                          : Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedCategoryIndex = index;
                  });
                },
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
