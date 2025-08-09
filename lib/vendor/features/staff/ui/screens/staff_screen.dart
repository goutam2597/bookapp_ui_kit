import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/vendor/features/common_widgets/reusable_dropdown_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_switch.dart';
import 'package:book_app/vendor/features/staff/ui/screens/add_staff_screen.dart';
import 'package:book_app/vendor/features/staff/ui/screens/holiday_screen.dart';
import 'package:book_app/vendor/features/staff/ui/screens/service_assignment_screen.dart';
import 'package:book_app/vendor/features/staff/ui/screens/service_days_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  final List<String> manage = ['Time Slots', 'Holidays'];
  final List<String> actionItems = ['Edit', 'Delete'];

  final List<Map<String, String>> staffList = [
    {
      'name': 'Alex Johns',
      'username': 'alexj',
      'email': 'alex.johns@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/6880c409001e0.jpg',
    },
    {
      'name': 'Sarah Khan',
      'username': 'sarahk',
      'email': 'sarah.khan@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2ff3cd7c9f.png',
    },
    {
      'name': 'Sarah Khan',
      'username': 'sarahk',
      'email': 'sarah.khan@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/img/admins/66d2fa86e75bb.png',
    },
    {
      'name': 'Sarah Khan',
      'username': 'sarahk',
      'email': 'sarah.khan@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fed129705.png',
    },
    {
      'name': 'Sarah Khan',
      'username': 'sarahk',
      'email': 'sarah.khan@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fdfed8692.png',
    },
    {
      'name': 'Sarah Khan',
      'username': 'sarahk',
      'email': 'sarah.khan@example.com',
      'image':
          'https://masud.kreativdev.com/bookapp/assets/admin/img/vendor-photo/66d2fdb2348ef.png',
    },
  ];

  late List<bool> isSwitchedList;
  late List<String?> manageScheduleList;
  late List<String?> manageActionList;

  @override
  void initState() {
    super.initState();
    isSwitchedList = List.generate(staffList.length, (_) => false);
    manageScheduleList = List.generate(staffList.length, (_) => null);
    manageActionList = List.generate(staffList.length, (_) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(title: 'Staffs'),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CustomSearchBarWidget(hintText: 'Search Staffs'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 50,
              child: CustomButtonWidget(
                text: 'Add Staffs',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStaffScreen()),
                  );
                },
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CustomHeaderTextWidget(
              text: 'Staff Login Url',
              fontSize: 16,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 16),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const Text(
                      'https://masud.kreativdev.com/staff/login',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SvgPicture.asset(AssetsPath.copySvg, height: 28),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: staffList.length,
              itemBuilder: (context, index) {
                final staff = staffList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left: Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  staff['image'] ??
                                      'https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg',
                                  height: 90,
                                  width: 104,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Right: Info + Controls
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Name, Username, Email
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name: ${staff['name']}',
                                          style: AppTextStyles.bodyLargeGrey,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'User Name: ${staff['username']}',
                                          style: AppTextStyles.bodyLargeGrey,
                                        ),
                                        SizedBox(height: 8),
                                        FittedBox(
                                          child: Text(
                                            'Email: ${staff['email']}',
                                            style: AppTextStyles.bodyLargeGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Services:',
                                  style: AppTextStyles.bodyLargeGrey,
                                ),
                                const SizedBox(width: 6),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    backgroundColor: AppColors.themeColor,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    minimumSize: const Size(0, 26),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ServiceAssignmentScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text('Assign'),
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  'Account Status:',
                                  style: AppTextStyles.bodyLargeGrey,
                                ),
                                const SizedBox(width: 8),
                                CustomSwitch(
                                  value: isSwitchedList[index],
                                  onChanged: (val) => setState(() {
                                    isSwitchedList[index] = val;
                                  }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          FittedBox(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Schedule:',
                                          style: AppTextStyles.bodyLargeGrey,
                                        ),
                                        const SizedBox(width: 8),
                                        ReusableDropdownWidget(
                                          title: 'Manage',
                                          selectedValue:
                                              manageScheduleList[index],
                                          items: manage,
                                          onChanged: (value) {
                                            setState(() {
                                              manageScheduleList[index] = value;
                                            });
                                          },
                                          navigationRoutes: const {
                                            'Time Slots': ServiceDaysScreen(),
                                            'Holidays': HolidayScreen(),
                                          },
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 8),
                                  ],
                                ),

                                // Action Dropdown
                                Row(
                                  children: [
                                    Text(
                                      'Action:',
                                      style: AppTextStyles.bodyLargeGrey,
                                    ),
                                    const SizedBox(width: 8),
                                    ReusableDropdownWidget(
                                      title: 'Action',
                                      selectedValue: manageActionList[index],
                                      items: actionItems,
                                      onChanged: (value) {
                                        setState(() {
                                          manageActionList[index] = value;
                                        });

                                        if (value == 'Edit') {
                                        } else if (value == 'Delete') {}
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
