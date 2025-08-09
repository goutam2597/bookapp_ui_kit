import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/common/ui/widgets/dropdown_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class AssignedStaffModel {
  final String staffName;
  final String service;

  AssignedStaffModel({required this.staffName, required this.service});
}

class ServiceAssignmentScreen extends StatefulWidget {
  const ServiceAssignmentScreen({super.key});

  @override
  State<ServiceAssignmentScreen> createState() =>
      _ServiceAssignmentScreenState();
}

class _ServiceAssignmentScreenState extends State<ServiceAssignmentScreen> {
  final List<AssignedStaffModel> assignedStaffList = [
    AssignedStaffModel(
      staffName: 'Olivia Martinez',
      service: 'General Checkup',
    ),
    AssignedStaffModel(staffName: 'Liam Patel', service: 'AC Installation'),
    AssignedStaffModel(
      staffName: 'Sophia Nguyen',
      service: 'Haircut & Styling',
    ),
    AssignedStaffModel(staffName: 'Noah Kim', service: 'Home Deep Cleaning'),
    AssignedStaffModel(staffName: 'Emma Shah', service: 'Water Pipe Fixing'),
    AssignedStaffModel(staffName: 'James Lee', service: 'Math Tutoring'),
    AssignedStaffModel(staffName: 'Ava Brown', service: 'Laptop Repair'),
    AssignedStaffModel(staffName: 'Ethan Davis', service: 'Fan Repair'),
    AssignedStaffModel(staffName: 'Isabella Wilson', service: 'Home Painting'),
    AssignedStaffModel(
      staffName: 'Mason Clark',
      service: 'Computer Course Setup',
    ),
  ];

  final List<String> services = [
    'Building Wiring Experts',
    'Electrical Experts',
    'Plumbing Experts',
    'Painting Experts',
    'Carpentry Experts',
  ];

  void _confirmUnassign(int index) {
    final _ = assignedStaffList[index];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        title: Center(
          child: Text('Are you sure?', style: AppTextStyles.headingLarge),
        ),
        content: Text(
          'You won\'t be able to revert this!',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.colorText,
            fontSize: 16,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              setState(() {
                assignedStaffList.removeAt(index);
              });
              CustomSnackBar.show(
                snackPosition: SnackPosition.BOTTOM,
                context,
                'Service Unassigned!',
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            const CustomAppBar(title: 'Service Assignment'),
            const Padding(
              padding: EdgeInsets.all(16),
              child: CustomSearchBarWidget(hintText: 'Search Services/Staff'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 50,
                child: Builder(
                  builder: (context) {
                    return CustomButtonWidget(
                      text: 'Assign Service',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => DropdownAlertDialog(
                            dialogType: DialogType.dropdown,
                            title: 'Assign Service',
                            items: services,
                            onConfirm: (selectedValue) {
                              if (selectedValue != null) {
                                return CustomSnackBar.show(
                                  snackPosition: SnackPosition.BOTTOM,
                                  context,
                                  '$selectedValue Service is Assigned!',
                                );
                              } else {
                                return CustomSnackBar.show(
                                  snackPosition: SnackPosition.BOTTOM,
                                  context,
                                  'Please select a service!',
                                );
                              }
                            },
                          ),
                        );
                      },
                      fontSize: 16,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: assignedStaffList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final staff = assignedStaffList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: AssignedStaffCard(
                      staffName: staff.staffName,
                      service: staff.service,
                      onUnassign: () => _confirmUnassign(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignedStaffCard extends StatelessWidget {
  final String staffName;
  final String service;
  final VoidCallback onUnassign;

  const AssignedStaffCard({
    super.key,
    required this.staffName,
    required this.service,
    required this.onUnassign,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Staff Name: $staffName',
                //   style: AppTextStyles.bodyLargeGrey,
                // ),
                // const SizedBox(height: 4),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Service Title: $service',
                    style: AppTextStyles.bodyLargeGrey,
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 32,
                    child: FittedBox(
                      child: OutlinedButton.icon(
                        iconAlignment: IconAlignment.end,
                        onPressed: onUnassign,
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.themeColor,
                          side: BorderSide(color: AppColors.themeColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        label: Text(
                          'Unassign',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        icon: SvgPicture.asset(
                          AssetsPath.deleteSvg,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
