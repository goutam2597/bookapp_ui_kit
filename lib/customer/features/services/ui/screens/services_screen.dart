import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/ui/screens/notifications_screen.dart';
import 'package:book_app/customer/features/services/ui/widgets/services_card_widget_for_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../../../app/app_colors.dart';
import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';
import '../../../../../common/ui/widgets/dropdown_alert_dialog.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final List<String> languages = ['English', 'Arabic', 'Spanish'];
  List<ServiceCardModel> services = List.from(dummyServiceCardList);

  Future<void> _refreshServices() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      services = List.from(dummyServiceCardList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          const spacing = 8.0;
          const padding = 16.0;

          // Updated column logic including 300px
          int crossAxisCount;
          if (screenWidth >= 1000) {
            crossAxisCount = 6;
          } else if (screenWidth >= 800) {
            crossAxisCount = 5;
          } else if (screenWidth >= 600) {
            crossAxisCount = 4;
          } else if (screenWidth >= 400) {
            crossAxisCount = 2;
          } else if (screenWidth >= 300) {
            crossAxisCount = 2;
          } else {
            crossAxisCount = 1;
          }

          final itemWidth =
              (screenWidth - (padding * 2) - (spacing * (crossAxisCount - 1))) /
              crossAxisCount;

          return RefreshIndicator(
            onRefresh: _refreshServices,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const CustomSearchBarWidget(hintText: 'Search Services'),
                  const SizedBox(height: 16),

                  if (services.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 64),
                        child: Text(
                          'No services available.',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    )
                  else
                    AnimationLimiter(
                      child: Wrap(
                        spacing: spacing,
                        runSpacing: spacing,
                        children: List.generate(services.length, (index) {
                          final item = services[index];
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            columnCount: crossAxisCount,
                            child: ScaleAnimation(
                              scale: 0.85,
                              child: FadeInAnimation(
                                child: SizedBox(
                                  width: itemWidth,
                                  child: ServicesCardWidgetForGrid(item: item),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AssetsPath.appLogoSvg, height: 24, width: 125),
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
                          } else {
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
}
