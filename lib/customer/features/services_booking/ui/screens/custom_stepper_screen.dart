import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/customer/features/home/data/models/service_card_model.dart';
import 'package:book_app/customer/features/home/data/models/staff_model.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/billing_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/booking_login_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/booking_staff_selection_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/date_n_time_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/payment_confirmation_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/screens/payment_screen.dart';
import 'package:book_app/customer/features/services_booking/ui/widgets/custom_stepper_widget.dart';
import 'package:flutter/material.dart';

class CustomStepperScreen extends StatefulWidget {
  final ServiceCardModel selectedService;

  const CustomStepperScreen({super.key, required this.selectedService});

  @override
  State<CustomStepperScreen> createState() => _CustomStepperScreenState();
}

class _CustomStepperScreenState extends State<CustomStepperScreen> {
  // Tracks the active step in the booking flow (1: Staff, 2: Date/Time, 3: Forms, 4: Confirmation)
  int activeStep = 1;
  // Tracks which sub-form is visible in step 3 (0: Login, 1: Billing, 2: Payment)
  int currentSubScreen = 0;

  StaffModel? selectedStaff;
  DateTime? selectedDate;
  String? selectedSlot;
  String? selectedPayment;

  // Staff selection callback
  void _onStaffSelected(StaffModel staff) {
    setState(() {
      selectedStaff = staff;
      activeStep = 2;
    });
  }

  // Date and slot selection callback
  void _onDateSlotSelected(DateTime date, String slot) {
    setState(() {
      selectedDate = date;
      selectedSlot = slot;
      activeStep = 3;
      currentSubScreen = 0;
    });
  }

  // Go to next step/subscreen as per flow
  void _goToNextStep() {
    if (activeStep == 3) {
      if (currentSubScreen < 2) {
        setState(() => currentSubScreen++);
      } else {
        setState(() => activeStep = 4);
      }
    }
  }

  // Go to previous step/subscreen as per flow
  void _goToPreviousStep() {
    if (activeStep == 2) {
      setState(() => activeStep = 1);
    } else if (activeStep == 3) {
      if (currentSubScreen > 0) {
        setState(() => currentSubScreen--);
      } else {
        setState(() => activeStep = 2);
      }
    } else if (activeStep == 4) {
      setState(() {
        activeStep = 3;
        currentSubScreen = 2;
      });
    } else {
      Navigator.pop(context);
    }
  }

  /// Returns the widget to show for the current step/subscreen.
  Widget _getCurrentScreen() {
    if (activeStep == 1) {
      return BookingStaffSelectionScreen(
        serviceCardModel: widget.selectedService,
        onStaffSelected: _onStaffSelected,
      );
    } else if (activeStep == 2) {
      return DateNTimeScreen(
        onNext: _onDateSlotSelected,
        onBack: _goToPreviousStep,
        serviceCardModel: widget.selectedService,
      );
    } else if (activeStep == 3) {
      switch (currentSubScreen) {
        case 0:
          return BookingLoginScreen(
            onNext: _goToNextStep,
            onBack: _goToPreviousStep,
            serviceCardModel: widget.selectedService,
            selectedStaff: selectedStaff,
            selectedDate: selectedDate,
            selectedTimeSlot: selectedSlot,
          );
        case 1:
          return BillingScreen(
            onNext: _goToNextStep,
            onBack: _goToPreviousStep,
            serviceCardModel: widget.selectedService,
            selectedStaff: selectedStaff,
            selectedDate: selectedDate,
            selectedTimeSlot: selectedSlot,
          );
        case 2:
          return PaymentScreen(
            onBack: _goToPreviousStep,
            onPaymentComplete: (paymentMethod) {
              setState(() {
                selectedPayment = paymentMethod;
                activeStep = 4;
              });
            },
            serviceCardModel: widget.selectedService,
            selectedStaff: selectedStaff,
            selectedDate: selectedDate,
            selectedTimeSlot: selectedSlot,
          );
      }
    } else if (activeStep == 4) {
      return PaymentConfirmationScreen(
        onBackToHome: () =>
            Navigator.popUntil(context, (route) => route.isFirst),
        serviceCardModel: widget.selectedService,
        selectedStaff: selectedStaff,
        selectedDate: selectedDate,
        selectedTimeSlot: selectedSlot,
        selectedPaymentMethod: selectedPayment,
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    // Set the stepper progress index (5 for confirmation, 4 for payment, else actual activeStep)
    final int stepDisplayIndex = activeStep == 4
        ? 5
        : (activeStep == 3 && currentSubScreen == 2)
        ? 4
        : activeStep;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Service Booking', onTap: _goToPreviousStep),
          const SizedBox(height: 16),
          CustomStepper(activeStep: stepDisplayIndex),
          const SizedBox(height: 8),
          Expanded(child: _getCurrentScreen()),
        ],
      ),
    );
  }
}
