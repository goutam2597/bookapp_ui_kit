import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/vendor/features/common_widgets/reusable_dropdown_widget.dart';
import 'package:book_app/vendor/features/support_tickets/ui/screens/conversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllTickets extends StatefulWidget {
  const AllTickets({super.key});

  @override
  State<AllTickets> createState() => _AllTicketsState();
}

class _AllTicketsState extends State<AllTickets> {
  final List<String> actionItems = ['Message', 'Delete'];

  // Sample tickets list (replace with API data later)
  final List<Map<String, String>> tickets = [
    {
      'id': 'TCK12345',
      'email': 'user1@example.com',
      'subject': 'Membership Not Working',
      'status': 'Open',
      'time': '27-07-2025 05.37 AM',
    },
    {
      'id': 'TCK12346',
      'email': 'user2@example.com',
      'subject': 'Membership Not Working',
      'status': 'Pending',
      'time': '27-07-2025 05.37 AM',
    },
    {
      'id': 'TCK12347',
      'email': 'user3@example.com',
      'subject': 'Membership Not Working',
      'status': 'Closed',
      'time': '27-07-2025 05.37 AM',
    },
  ];

  late List<String?> manageActionList;

  @override
  void initState() {
    super.initState();
    manageActionList = List<String?>.from(List.filled(tickets.length, null));
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'closed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void handleActionSelected(String? action, int index) {
    if (action == null) return;

    if (action == 'Message') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ConversationScreen(tickets: tickets[index]),
        ),
      );
    } else if (action == 'Delete') {
      setState(() {
        tickets.removeAt(index);
        manageActionList.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Support Tickets'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final booking = tickets[index];
                final status = booking['status'] ?? '';

                return Card(
                  color: Colors.white,
                  elevation: 0.5,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ticket ID
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.idSvg),
                            const SizedBox(width: 4),
                            Text('Ticket ID: ${booking['id']}'),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Email
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.envelopeSvg),
                            const SizedBox(width: 4),
                            Expanded(child: Text('Email: ${booking['email']}')),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Subject
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.upSvg),
                            const SizedBox(width: 4),
                            Text('Subject: ${booking['subject']}'),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Status and Action Dropdown
                        FittedBox(
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetsPath.pieSvg),
                              const SizedBox(width: 4),
                              Row(
                                children: [
                                  const Text('Status: '),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 24,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: getStatusColor(status),
                                    ),
                                    child: Text(
                                      status,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              const SizedBox(
                                height: 16,
                                child: VerticalDivider(),
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(AssetsPath.filterSvg),
                              const SizedBox(width: 4),
                              const Text('Action'),
                              const SizedBox(width: 8),
                              ReusableDropdownWidget(
                                title: 'Action',
                                selectedValue: manageActionList[index],
                                items: actionItems,
                                onChanged: (val) {
                                  setState(() {
                                    manageActionList[index] = val;
                                  });
                                  handleActionSelected(val, index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
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
