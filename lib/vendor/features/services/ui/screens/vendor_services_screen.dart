import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_icon_button_widgets.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/vendor/features/services/ui/screens/add_services.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorServicesScreen extends StatefulWidget {
  const VendorServicesScreen({super.key});

  @override
  State<VendorServicesScreen> createState() => _VendorServicesScreenState();
}

class _VendorServicesScreenState extends State<VendorServicesScreen> {
  late List<bool> isSwitchedList;

  @override
  void initState() {
    super.initState();
    isSwitchedList = List.generate(dummyVendorServiceData.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Services'),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const CustomSearchBarWidget(
                      showFilter: false,
                      hintText: 'Search by Services Name..',
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 52,
                      child: CustomButtonWidget(
                        text: 'Add Services',
                        fontSize: 18,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddServices(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: dummyVendorServiceData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final vendorsServiceData =
                            dummyVendorServiceData[index];
                        return Card(
                          elevation: 0.3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade200),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.asset(
                                      vendorsServiceData.thumbImage,
                                      width: double.infinity,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vendorsServiceData.titleText,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.bodyLarge,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            vendorsServiceData.price,
                                            style: AppTextStyles.headingSmall
                                                .copyWith(
                                                  color: AppColors.themeColor,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 16,
                                            child: VerticalDivider(
                                              thickness: 2,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          Text(
                                            vendorsServiceData.subtitle,
                                            style: AppTextStyles.bodySmall,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          CustomSwitch(
                                            value: isSwitchedList[index],
                                            onChanged: (value) {
                                              setState(() {
                                                isSwitchedList[index] = value;
                                              });
                                            },
                                          ),
                                          Spacer(),
                                          FittedBox(
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Action:',
                                                  style: AppTextStyles
                                                      .bodyLargeGrey,
                                                ),
                                                const SizedBox(width: 8),
                                                CustomIconButtonWidget(
                                                  height: 34,
                                                  width: 34,
                                                  assetPath: AssetsPath.editSvg,
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (_) =>
                                                            const AddServices(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                const SizedBox(width: 4),
                                                CustomIconButtonWidget(
                                                  height: 34,
                                                  width: 34,
                                                  assetPath:
                                                      AssetsPath.deleteSvg,
                                                  onTap: () {
                                                    final deletedTitle =
                                                        vendorsServiceData
                                                            .titleText;

                                                    setState(() {
                                                      dummyVendorServiceData
                                                          .removeAt(index);
                                                      isSwitchedList.removeAt(
                                                        index,
                                                      );
                                                    });
                                                    CustomSnackBar.show(
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      context,
                                                      '$deletedTitle deleted',
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
}

class VendorServiceModel {
  final String titleText;
  final String price;
  final String subtitle;
  final String thumbImage;

  VendorServiceModel({
    required this.thumbImage,
    required this.titleText,
    required this.price,
    required this.subtitle,
  });
}

List<VendorServiceModel> dummyVendorServiceData = [
  VendorServiceModel(
    price: '\$651',
    subtitle: 'Pay to Feature',
    titleText: 'Housing Plumbing Solution',
    thumbImage: AssetsPath.servicePng1,
  ),
  VendorServiceModel(
    price: '\$1200',
    subtitle: 'Pay to Feature',
    titleText: 'Deluxe Interior Painting Service',
    thumbImage: AssetsPath.servicePng3,
  ),
  VendorServiceModel(
    price: '\$430',
    subtitle: 'Pay to Feature',
    titleText: 'Fast AC Installation & Repair',
    thumbImage: AssetsPath.servicePng2,
  ),
  VendorServiceModel(
    price: '\$950',
    subtitle: 'Pay to Feature',
    titleText: 'Complete Home Cleaning Package',
    thumbImage: AssetsPath.servicePng4,
  ),
  VendorServiceModel(
    price: '\$790',
    subtitle: 'Pay to Feature',
    titleText: 'Smart Home Automation Setup',
    thumbImage: AssetsPath.servicePng2,
  ),
  VendorServiceModel(
    price: '\$1150',
    subtitle: 'Pay to Feature',
    titleText: 'Modular Kitchen Renovation',
    thumbImage: AssetsPath.servicePng1,
  ),
  VendorServiceModel(
    price: '\$510',
    subtitle: 'Pay to Feature',
    titleText: 'High-Speed WiFi Installation',
    thumbImage: AssetsPath.servicePng3,
  ),
  VendorServiceModel(
    price: '\$850',
    subtitle: 'Pay to Feature',
    titleText: 'Water Tank Cleaning Service',
    thumbImage: AssetsPath.servicePng4,
  ),
  VendorServiceModel(
    price: '\$390',
    subtitle: 'Pay to Feature',
    titleText: 'Professional Sofa Shampooing',
    thumbImage: AssetsPath.servicePng2,
  ),
  VendorServiceModel(
    price: '\$1300',
    subtitle: 'Pay to Feature',
    titleText: 'Roof Waterproofing & Repairs',
    thumbImage: AssetsPath.servicePng1,
  ),
];
