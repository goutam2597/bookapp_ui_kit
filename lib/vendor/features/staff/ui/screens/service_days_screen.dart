import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/vendor/features/common_widgets/reusable_dropdown_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_toggle_button.dart';
import 'package:book_app/vendor/features/staff/ui/screens/time_slots_screen.dart';
import 'package:flutter/material.dart';

class ServiceDaysScreen extends StatefulWidget {
  const ServiceDaysScreen({super.key});

  @override
  State<ServiceDaysScreen> createState() => _ServiceDaysScreenState();
}

class _ServiceDaysScreenState extends State<ServiceDaysScreen> {
  bool isServiceEnabled = true;

  final List<String> weekDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  final List<String> items = ['Yes', 'No'];
  late List<String?> manageActionList;

  /// Demo static time slots for each day with 'time' and 'booking' details.
  final Map<String, List<Map<String, String>>> demoTimeSlots = {
    'Sunday': [
      {'day': 'Sunday', 'time': '9:00 AM - 10:00 AM', 'booking': '5'},
      {'day': 'Sunday', 'time': '10:00 AM - 11:00 AM', 'booking': '3'},
      {'day': 'Sunday', 'time': '11:00 AM - 12:00 PM', 'booking': '8'},
    ],
    'Monday': [
      {'day': 'Monday', 'time': '9:00 AM - 10:00 AM', 'booking': '10'},
      {'day': 'Monday', 'time': '10:00 AM - 11:00 AM', 'booking': '7'},
      {'day': 'Monday', 'time': '11:00 AM - 12:00 PM', 'booking': '6'},
    ],
    'Tuesday': [
      {'day': 'Tuesday', 'time': '9:00 AM - 10:00 AM', 'booking': '12'},
      {'day': 'Tuesday', 'time': '10:00 AM - 11:00 AM', 'booking': '9'},
      {'day': 'Tuesday', 'time': '11:00 AM - 12:00 PM', 'booking': '5'},
    ],
    'Wednesday': [
      {'day': 'Wednesday', 'time': '9:00 AM - 10:00 AM', 'booking': '8'},
      {'day': 'Wednesday', 'time': '10:00 AM - 11:00 AM', 'booking': '6'},
      {'day': 'Wednesday', 'time': '11:00 AM - 12:00 PM', 'booking': '4'},
    ],
    'Thursday': [
      {'day': 'Thursday', 'time': '9:00 AM - 10:00 AM', 'booking': '15'},
      {'day': 'Thursday', 'time': '10:00 AM - 11:00 AM', 'booking': '10'},
      {'day': 'Thursday', 'time': '11:00 AM - 12:00 PM', 'booking': '7'},
    ],
    'Friday': [
      {'day': 'Friday', 'time': '9:00 AM - 10:00 AM', 'booking': '20'},
      {'day': 'Friday', 'time': '10:00 AM - 11:00 AM', 'booking': '15'},
      {'day': 'Friday', 'time': '11:00 AM - 12:00 PM', 'booking': '10'},
    ],
    'Saturday': [
      {'day': 'Saturday', 'time': '9:00 AM - 10:00 AM', 'booking': '25'},
      {'day': 'Saturday', 'time': '10:00 AM - 11:00 AM', 'booking': '20'},
      {'day': 'Saturday', 'time': '11:00 AM - 12:00 PM', 'booking': '15'},
    ],
  };

  @override
  void initState() {
    super.initState();
    manageActionList = List<String?>.filled(weekDays.length, 'No');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const CustomAppBar(title: 'Time Slots'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomHeaderTextWidget(
                      text: 'Customize Service Day',
                      fontSize: 16,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 56,
                      child: CustomToggleButton(
                        leftLabel: 'Yes',
                        rightLabel: 'No',
                        isEnabled: isServiceEnabled,
                        onChanged: (val) => setState(() => isServiceEnabled = val),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'If you select No, then Schedule > Days will be applied to this staff.',
                    ),
                    const SizedBox(height: 24),

                    /// ───── Card Container ─────
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 8,
                              top: 16,
                            ),
                            child: const Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Day',
                                    style: AppTextStyles.bodyLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    'Time Slots',
                                    style: AppTextStyles.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Weekend',
                                    style: AppTextStyles.bodyLarge,
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(thickness: 1),

                          /// Days List
                          ...List.generate(weekDays.length, (index) {
                            final weekday = weekDays[index];
                            // Ensure slots is a non-null List<Map<String, String>>
                            final List<Map<String, String>> slots =
                                demoTimeSlots[weekday] ?? [];

                            return Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: index % 2 != 0
                                    ? Colors.white
                                    : Colors.grey.shade100,
                              ),
                              child: Row(
                                children: [
                                  /// Day Name
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      weekday,
                                      style: AppTextStyles.bodyLargeGrey,
                                    ),
                                  ),

                                  /// Manage Button
                                  Expanded(
                                    flex: 3,
                                    child: Align(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TimeSlotsScreen(timeSlots: slots),
                                            ),
                                          );
                                        },
                                        borderRadius: BorderRadius.circular(8),
                                        child: FittedBox(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: const Text(
                                              'Manage',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  /// Dropdown
                                  Expanded(
                                    flex: 2,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FittedBox(
                                        child: SizedBox(
                                          height: 35,
                                          width: 100,
                                          child: ReusableDropdownWidget(
                                            selectedValue: manageActionList[index],
                                            items: items,
                                            title: 'Action',
                                            onChanged: (value) {
                                              setState(() {
                                                manageActionList[index] = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
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
}
