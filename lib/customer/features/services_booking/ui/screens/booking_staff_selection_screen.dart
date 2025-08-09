import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:flutter/material.dart';

/// Staff selection screen for booking flow.
/// Shows available staff for a selected service.
class BookingStaffSelectionScreen extends StatelessWidget {
  final ServiceCardModel serviceCardModel;
  final ValueChanged<StaffModel> onStaffSelected;

  const BookingStaffSelectionScreen({
    super.key,
    required this.serviceCardModel,
    required this.onStaffSelected,
  });

  @override
  Widget build(BuildContext context) {
    final staffList = serviceCardModel.staffs ?? [];
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalPadding = 16;
    const double spacing = 8;
    final double itemWidth =
        (screenWidth - horizontalPadding * 2 - spacing) / 2;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: CustomHeaderTextWidget(text: 'Choose Your Staff'),
                  ),
                  // Staff Cards
                  Wrap(
                    spacing: spacing,
                    runSpacing: 24,
                    children: List.generate(staffList.length, (index) {
                      final staff = staffList[index];
                      return SizedBox(
                        width: itemWidth,
                        height: 250,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () => onStaffSelected(staff),
                          child: StaffCardWidget(
                            item: staff,
                            onSelectStaff: () => onStaffSelected(staff),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 56),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Staff Card used inside the staff selection screen.
class StaffCardWidget extends StatelessWidget {
  final StaffModel item;
  final VoidCallback onSelectStaff;

  const StaffCardWidget({
    super.key,
    required this.item,
    required this.onSelectStaff,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade50,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(item.staffImage ?? ''),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item.staffName ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    item.staffEmail ?? 'yourmailaas@mail.com',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
          // Select Staff Button (styled as per design)
          Positioned(
            bottom: -20,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: onSelectStaff,
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  elevation: 0.1,
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Select Staff',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
