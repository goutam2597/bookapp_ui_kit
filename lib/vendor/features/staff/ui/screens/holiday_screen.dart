import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/dropdown_alert_dialog.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class HolidayScreen extends StatefulWidget {
  const HolidayScreen({super.key});

  @override
  State<HolidayScreen> createState() => _HolidayScreenState();
}

class _HolidayScreenState extends State<HolidayScreen> {
  bool isServiceEnabled = true;
  final List<DateTime> holidayList = [];

  @override
  void initState() {
    super.initState();
    // Add static sample holidays
    holidayList.addAll([
      DateTime.now(),
      DateTime.now().add(const Duration(days: 7)),
      DateTime.now().add(const Duration(days: 14)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Holidays'),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderTextWidget(
                  text: 'Customize Holidays',
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
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  child: CustomButtonWidget(
                    text: 'Add Holiday',
                    fontSize: 16,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => DropdownAlertDialog(
                          title: 'Choose Date',
                          dialogType: DialogType.calendar,
                          onConfirm: (value) {
                            if (value is DateTime) {
                              CustomSnackBar.show(
                                snackPosition: SnackPosition.BOTTOM,
                                context,
                                'Holiday Added Successfully',
                              );
                              setState(() {
                                if (!holidayList.any(
                                  (date) =>
                                      date.toLocal().toString().split(' ')[0] ==
                                      value.toLocal().toString().split(' ')[0],
                                )) {
                                  holidayList.add(value);
                                }
                              });
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // ───── Holiday Table Section ─────
                if (holidayList.isEmpty)
                  const Center(
                    child: Text(
                      'NO HOLIDAY FOUND!',
                      style: AppTextStyles.headingLarge,
                    ),
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text('Date', style: AppTextStyles.bodyLarge),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Name', style: AppTextStyles.bodyLarge),
                          ),
                          Expanded(
                            child: Text(
                              'Action',
                              style: AppTextStyles.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 1.5),
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: holidayList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 4),
                        itemBuilder: (context, index) {
                          final dateStr = holidayList[index]
                              .toLocal()
                              .toString()
                              .split(' ')[0];
                          return Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  dateStr,
                                  style: AppTextStyles.bodyLargeGrey,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'James Anderson',
                                  style: AppTextStyles.bodyLargeGrey,
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      holidayList.removeAt(index);
                                    });
                                    CustomSnackBar.show(
                                      snackPosition: SnackPosition.BOTTOM,
                                      context,
                                      'Holiday Deleted Successfully',
                                    );
                                  },
                                  icon: const CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
