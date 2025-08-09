import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTabBarWidget extends StatelessWidget {
  final String? description;
  final String? features;
  final String? address;
  final String? phone;
  final String? email;
  final String? reviews;

  const CustomTabBarWidget({
    super.key,
    this.description,
    this.features,
    this.address,
    this.phone,
    this.email,
    this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          // ───── Tab Bar Section ─────
          const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            splashFactory: NoSplash.splashFactory,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5, color: AppColors.themeColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Features'),
              Tab(text: 'Address'),
              Tab(text: 'Reviews'),
            ],
          ),
          const SizedBox(height: 16),
          // ───── TabBarView Section ─────
          SizedBox(
            height: 185,
            child: TabBarView(
              children: [
                // Description tab (dynamic content)
                Text(
                  description ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                // Features tab (placeholder)
                Text(features ?? '', style: TextStyle(fontSize: 16)),
                // Address tab (placeholder)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Contact Details:',
                      style: AppTextStyles.headingMedium,
                    ),
                    SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.themeColor),
                              ),
                              child: Icon(
                                FontAwesomeIcons.locationDot,
                                size: 20,
                                color: AppColors.themeColor,
                              ),
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: address,
                            style: AppTextStyles.bodyLargeGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.themeColor),
                              ),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 20,
                                color: AppColors.themeColor,
                              ),
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: phone,
                            style: AppTextStyles.bodyLargeGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.themeColor),
                              ),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 20,
                                color: AppColors.themeColor,
                              ),
                            ),
                          ),
                          TextSpan(text: '  '),
                          TextSpan(
                            text: email,
                            style: AppTextStyles.bodyLargeGrey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Reviews tab (placeholder)
                Center(
                  child: Text(
                    reviews??'',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
