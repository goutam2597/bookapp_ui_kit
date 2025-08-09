import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/staff/features/staff_appointment/ui/widgets/appointments_card_widget.dart';
import 'package:book_app/staff/features/staff_appointment/ui/widgets/appointments_filter_header.dart';
import 'package:flutter/material.dart';

class StaffAppointmentsScreen extends StatefulWidget {
  const StaffAppointmentsScreen({super.key});

  @override
  State<StaffAppointmentsScreen> createState() =>
      _StaffAppointmentsScreenState();
}

class _StaffAppointmentsScreenState extends State<StaffAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Appointments'),
          Expanded(child: SingleChildScrollView(child: BookingFilterWidget())),
        ],
      ),
    );
  }
}

class BookingFilterWidget extends StatefulWidget {
  const BookingFilterWidget({super.key});

  @override
  State<BookingFilterWidget> createState() => _BookingFilterWidgetState();
}

class _BookingFilterWidgetState extends State<BookingFilterWidget> {
  final List<String> orderItems = ['Pending', 'Accept', 'Reject'];
  final List<String> actionItems = ['Receipt', 'Invoice', 'Delete'];
  final List<String> paymentOptions = ['All', 'Paid', 'Pending'];
  final List<String> orderOptions = ['All', 'Completed', 'Cancelled'];
  final List<String> refundedOptions = ['All', 'Yes', 'No'];

  final List<Map<String, String>> bookings = [
    {
      'id': '1235f',
      'date': '21-05-2025',
      'price': '\$250.00',
      'title': 'Advanced Diagnostic Screening',
      'customer': 'James Borner',
      'paymentStatus': 'Completed',
    },
    {
      'id': '1236g',
      'date': '22-05-2025',
      'price': '\$50.00',
      'title': 'General Health Check-up',
      'customer': 'Sarah Miller',
      'paymentStatus': 'Pending',
    },
    {
      'id': '1237h',
      'date': '23-05-2025',
      'price': '\$150.00',
      'title': 'Dental Cleaning and Consultation',
      'customer': 'David Chen',
      'paymentStatus': 'Completed',
    },
  ];

  String selectedPayment = 'All';
  String selectedOrder = 'All';
  String selectedRefunded = 'All';

  final TextEditingController _searchController = TextEditingController();
  late List<String?> manageActionList;
  late List<String?> manageOrderList;

  @override
  void initState() {
    super.initState();
    manageActionList = List<String?>.filled(bookings.length, null);
    manageOrderList = List<String?>.filled(bookings.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          AppointmentsFilterHeader(
            searchController: _searchController,
            paymentOptions: paymentOptions,
            selectedPayment: selectedPayment,
            onPaymentChanged: (val) => setState(() => selectedPayment = val),
            orderOptions: orderOptions,
            selectedOrder: selectedOrder,
            onOrderChanged: (val) => setState(() => selectedOrder = val),
            refundedOptions: refundedOptions,
            selectedRefunded: selectedRefunded,
            onRefundChanged: (val) => setState(() => selectedRefunded = val),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              return AppointmentsCardWidget(
                showAction: false,
                showOrder: false,
                booking: bookings[index],
                orderItems: orderItems,
                actionItems: actionItems,
                selectedOrder: manageOrderList[index],
                selectedAction: manageActionList[index],
                onOrderChanged: (val) =>
                    setState(() => manageOrderList[index] = val),
                onActionChanged: (val) {
                  setState(() => manageActionList[index] = val);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
