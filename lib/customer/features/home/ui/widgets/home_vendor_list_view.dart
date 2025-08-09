import 'package:book_app/app/assets_path.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/vendors/ui/widgets/vendors_card_widget.dart';
import 'package:flutter/material.dart';

class HomeVendorCardListView extends StatelessWidget {
  const HomeVendorCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: dummyServiceCardList.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          final service = dummyServiceCardList[index];
          final staff = (service.staffs?.isNotEmpty ?? false)
              ? service.staffs!.first
              : null;

          return VendorsCardWidget(
            image: staff?.staffImage ?? AssetsPath.userPlaceholderPng,
            name: staff?.staffName ?? 'Vendor Name',
            address: service.address,
            serviceQty: '${service.staffs?.length ?? 0}',
            onVisitStore: () {
              // TODO: Implement store navigation
            },
          );
        },
      ),
    );
  }
}
