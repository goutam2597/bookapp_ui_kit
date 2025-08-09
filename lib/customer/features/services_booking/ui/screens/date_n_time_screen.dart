import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/services_booking/data/dummy_date_data.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/booking_text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateNTimeScreen extends StatefulWidget {
  final void Function(DateTime date, String slot) onNext;
  final VoidCallback onBack;
  final ServiceCardModel serviceCardModel;

  const DateNTimeScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.serviceCardModel,
  });

  @override
  State<DateNTimeScreen> createState() => _DateNTimeScreenState();
}

class _DateNTimeScreenState extends State<DateNTimeScreen> {
  DateTime? selectedDate;
  int? selectedSlotIndex;

  // Returns true if the date is a weekend (holiday)
  bool isHoliday(DateTime date) =>
      date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

  // Gets time slots for the currently selected date
  List<String> getSlotsForSelectedDate() {
    if (selectedDate == null || isHoliday(selectedDate!)) return [];
    final key =
        "${selectedDate!.year.toString().padLeft(4, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}";
    return TimeSlots().availableTimeSlots[key] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = getSlotsForSelectedDate();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomHeaderTextWidget(text: 'Select Date & Time'),
              ),
              const SizedBox(height: 16),
              _buildCalendar(),
              const SizedBox(height: 24),
              if (selectedDate != null) _buildTimeSlotSection(timeSlots),
              const SizedBox(height: 24),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Builds the calendar with custom weekend and selected day styles
  Widget _buildCalendar() {
    return Card(
      color: Colors.grey.shade50,
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: selectedDate ?? DateTime.now(),
        selectedDayPredicate: (day) =>
            selectedDate != null &&
            day.year == selectedDate!.year &&
            day.month == selectedDate!.month &&
            day.day == selectedDate!.day,
        onDaySelected: (selected, focused) {
          setState(() {
            selectedDate = selected;
            selectedSlotIndex = null;
          });
        },
        enabledDayPredicate: (day) =>
            !(day.weekday == DateTime.saturday ||
                day.weekday == DateTime.sunday),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, _) {
            if (isHoliday(day)) {
              return Center(
                child: Text(
                  '${day.day}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return null;
          },
          todayBuilder: (context, day, _) => _buildDayCell(
            day,
            backgroundColor: isHoliday(day)
                ? Colors.red.shade100
                : Colors.blue.shade100,
            textColor: isHoliday(day) ? Colors.red : Colors.blue,
          ),
          selectedBuilder: (context, day, _) => _buildDayCell(
            day,
            backgroundColor: AppColors.themeColor,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }

  // Builds a single calendar cell
  Widget _buildDayCell(
    DateTime day, {
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Center(
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          '${day.day}',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Displays available slots or holiday/no-slot message
  Widget _buildTimeSlotSection(List<String> timeSlots) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 22.0, bottom: 10),
          child: Text(
            "Available Time Slots",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        if (isHoliday(selectedDate!))
          const Padding(
            padding: EdgeInsets.only(left: 22, top: 12),
            child: Text(
              "Holiday! No slots available.",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        else if (timeSlots.isNotEmpty)
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              timeSlots.length,
              (index) => ChoiceChip(
                label: Text(
                  timeSlots[index],
                  style: TextStyle(
                    color: selectedSlotIndex == index
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                selected: selectedSlotIndex == index,
                selectedColor: AppColors.themeColor,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: selectedSlotIndex == index
                        ? AppColors.themeColor
                        : Colors.grey.shade300,
                  ),
                ),
                onSelected: (_) {
                  setState(() {
                    selectedSlotIndex = index;
                  });
                },
              ),
            ),
          )
        else
          const Padding(
            padding: EdgeInsets.only(left: 22, top: 12, bottom: 24),
            child: Text(
              "No slots available for this date.",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  // Bottom nav buttons
  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BookingTextButtonWidget(
          onTap: widget.onBack,
          text: 'Previous Step',
          icon: Icons.arrow_back,
        ),
        BookingTextButtonWidget(
          iconRight: true,
          onTap: _handleNext,
          text: 'Next Step',
          icon: Icons.arrow_forward,
          iconColor: AppColors.themeColor,
          textColor: AppColors.themeColor,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }

  // Handles "Next Step" validation and callback
  void _handleNext() {
    if (selectedDate == null || selectedSlotIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a date and time slot!")),
      );
      return;
    }
    final selectedSlot = getSlotsForSelectedDate()[selectedSlotIndex!];
    widget.onNext(selectedDate!, selectedSlot);
  }
}
