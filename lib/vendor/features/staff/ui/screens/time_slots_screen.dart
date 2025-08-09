import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:intl/intl.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class TimeSlotsScreen extends StatefulWidget {
  // Corrected type to accept List of Maps with String keys and values
  final List<Map<String, String>> timeSlots;

  const TimeSlotsScreen({super.key, this.timeSlots = const []});

  @override
  State<TimeSlotsScreen> createState() => _TimeSlotsScreenState();
}

class _TimeSlotsScreenState extends State<TimeSlotsScreen> {
  bool isServiceEnabled = true;
  String? selectedStartTime;
  String? selectedEndTime;
  final TextEditingController _bookingController = TextEditingController();

  /// Holds the list of time slots displayed on the screen.
  /// Initialized with demo data from the constructor.
  late List<Map<String, String>> _displayTimeSlots;

  final List<String> _timeOptions = [
    '01:00am',
    '01:30am',
    '02:00am',
    '02:30am',
    '03:00am',
    '03:30am',
    '04:00am',
    '04:30am',
    '05:00am',
    '05:30am',
    '06:00am',
    '06:30am',
    '07:00am',
    '07:30am',
    '08:00am',
    '08:30am',
    '09:00am',
    '09:30am',
    '10:00am',
    '10:30am',
    '11:00am',
    '11:30am',
    '12:00pm',
    '12:30pm',
    '01:00pm',
    '01:30pm',
    '02:00pm',
    '02:30pm',
    '03:00pm',
    '03:30pm',
    '04:00pm',
    '04:30pm',
    '05:00pm',
    '05:30pm',
    '06:00pm',
    '06:30pm',
    '07:00pm',
    '07:30pm',
    '08:00pm',
    '08:30pm',
    '09:00pm',
    '09:30pm',
    '10:00pm',
    '10:30pm',
    '11:00pm',
    '11:30pm',
    '12:00am',
    '12:30am',
  ];

  @override
  void initState() {
    super.initState();
    // Initialize _displayTimeSlots with a deep copy of the widget's timeSlots
    // to ensure local modifications don't affect the parent's data.
    _displayTimeSlots = widget.timeSlots
        .map((e) => Map<String, String>.from(e))
        .toList();
  }

  @override
  void dispose() {
    _bookingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Time Slots'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customize Service Day',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 56,
                    child: CustomToggleButton(
                      leftLabel: 'Yes',
                      rightLabel: 'No',
                      isEnabled: isServiceEnabled,
                      onChanged: (val) =>
                          setState(() => isServiceEnabled = val),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'If you select No, then Schedule > Days will be applied to this staff.',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: CustomButtonWidget(
                      fontSize: 16,
                      text: 'Add Time Slot',
                      onPressed: _showAddTimeSlotDialog,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (_displayTimeSlots.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Center(
                        child: Text(
                          'NO TIME SLOT FOUND!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const CustomSearchBarWidget(
                              showFilter: false,
                              hintText: 'Search',
                            ),
                            const SizedBox(height: 24),
                            // Time slot list
                            _buildTimeSlotList(),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Displays the "Add Time Slot" dialog.
  void _showAddTimeSlotDialog() {
    _bookingController.clear();
    selectedStartTime = null;
    selectedEndTime = null;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 540,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDialogHeader(context),
                    Divider(thickness: 1.5, color: Colors.grey.shade300),
                    const SizedBox(height: 8),
                    const FormHeaderTextWidget(text: 'Start Time*'),
                    const SizedBox(height: 4),
                    _buildTimeDropdown(
                      'Choose Start Time',
                      true,
                      setModalState,
                    ),
                    const SizedBox(height: 16),
                    const FormHeaderTextWidget(text: 'End Time*'),
                    const SizedBox(height: 4),
                    _buildTimeDropdown('Choose End Time', false, setModalState),
                    const SizedBox(height: 16),
                    const FormHeaderTextWidget(text: 'Max Booking (Optional)'),
                    const SizedBox(height: 4),
                    TextField(
                      controller: _bookingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                        hintText: 'Add Maximum Booking Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Maximum number bookings staff can take in this time slot. If you do not want to put any limit, then leave it blank.',
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: CustomButtonWidget(
                        fontSize: 16,
                        text: 'Save Data',
                        onPressed: () {
                          _saveTimeSlot(context);
                          CustomSnackBar.show(
                            snackPosition: SnackPosition.BOTTOM,
                            context,
                            'Time Slot Added Successfully!',
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Handles saving a new time slot.
  void _saveTimeSlot(BuildContext context) {
    if (selectedStartTime != null && selectedEndTime != null) {
      setState(() {
        _displayTimeSlots.add({
          'day': DateFormat(
            'EEEE',
            'en_US',
          ).format(DateTime.now()), // Specify locale for consistent day name
          'time': '$selectedStartTime - $selectedEndTime',
          'booking': _bookingController.text.trim(), // Trim whitespace
        });
      });
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select both start and end times.'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  /// Builds the dropdown for selecting start or end time.
  Widget _buildTimeDropdown(
    String hintText,
    bool isStart,
    void Function(void Function()) setModal,
  ) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(12),
          dropdownColor: Colors.white,
          value: isStart ? selectedStartTime : selectedEndTime,
          hint: Text(hintText),
          isExpanded: true,
          items: _timeOptions
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) {
            setModal(() {
              if (isStart) {
                selectedStartTime = val;
              } else {
                selectedEndTime = val;
              }
            });
          },
        ),
      ),
    );
  }

  /// Builds the header section of the add time slot dialog.
  Widget _buildDialogHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Add Hour',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: SvgPicture.asset(AssetsPath.cancelSvg, width: 22),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the list of time slot cards.
  Widget _buildTimeSlotList() {
    return Column(
      children: _displayTimeSlots.map((slot) {
        final String day = slot['day'] ?? '';
        final String time = slot['time'] ?? '';
        final String booking = slot['booking'] ?? '';

        return Card(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AssetsPath.daySvg),
                    const SizedBox(width: 6),
                    Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                      child: VerticalDivider(width: 12, thickness: 1),
                    ),
                    SvgPicture.asset(AssetsPath.clockSvg),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: _showAddTimeSlotDialog,
                      icon: SvgPicture.asset(AssetsPath.pencilSvg),
                    ),
                  ],
                ),
                if (booking.isNotEmpty)
                  Row(
                    children: [
                      SvgPicture.asset(AssetsPath.bookingSvg),
                      const SizedBox(width: 6),
                      Text(
                        'Max Booking: $booking',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: SvgPicture.asset(AssetsPath.trashSvg),
                        onPressed: () {
                          setState(() {
                            _displayTimeSlots.remove(slot);
                          });
                          CustomSnackBar.show(
                            snackPosition: SnackPosition.BOTTOM,
                            context,
                            'Time Slot Deleted Successfully!',
                          );
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
