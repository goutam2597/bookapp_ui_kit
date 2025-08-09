import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class ServiceInquiry extends StatefulWidget {
  const ServiceInquiry({super.key});

  @override
  State<ServiceInquiry> createState() => _ServiceInquiryState();
}

class _ServiceInquiryState extends State<ServiceInquiry> {
  List<Map<String, String>> inquiries = [
    {
      'title': 'Expert Surgical Services',
      'message':
          'I am writing to inquire about urgent surgical services. I\'ve been experiencing significant discomfort and my doctor recommended immediate consultation for a potential procedure. Could you please provide information on available appointment slots within the next week or two? I\'m looking for specialized care and would appreciate details on your surgical department\'s expertise and procedures. My current condition requires prompt attention to avoid further complications.',
      'email': 'surgery@example.com',
    },
    {
      'title': 'Dental Cleaning',
      'message':
          'I am interested in scheduling regular monthly dental cleaning services. My previous dentist has retired, and I\'m looking for a new practice that emphasizes preventative care. Could you outline your dental hygiene services, including any membership plans or package deals available? I\'m keen on maintaining optimal oral health and ensuring my teeth receive professional attention consistently. Please let me know about your availability for initial appointments and your clinic\'s operating hours.',
      'email': 'dentalcare@myhealth.com',
    },
    {
      'title': 'Home Electrical Repair',
      'message':
          'I need immediate assistance with a faulty electrical wiring issue in my kitchen. The lights have been flickering, and some outlets are completely unresponsive, which is a safety concern. I\'m seeking a qualified electrician who can promptly diagnose and repair the problem efficiently. Please provide your availability for a service call and an estimated cost for emergency repairs. Ensuring the safety of my home\'s electrical system is my top priority right now.',
      'email': 'homefix@repairs.com',
    },
    {
      'title': 'Plumbing Emergency',
      'message':
          'I am experiencing a severe plumbing emergency at my residence. There\'s an urgent pipe burst in the basement, causing significant water leakage and potential damage. I require immediate dispatch of a skilled plumber to contain the situation and carry out necessary repairs. Please confirm your availability for emergency service and what your response time typically is for such critical issues. This is a time-sensitive matter, and I appreciate any quick assistance you can provide.',
      'email': 'plumber24x7@waterworks.com',
    },
    {
      'title': 'Fitness Trainer Service',
      'message':
          'I am actively looking for a qualified female fitness trainer who provides services at home. My goal is to establish a consistent workout routine and achieve specific fitness milestones, including strength and endurance. Could you provide information on your training programs, certifications, and availability for in-home sessions? I prefer personalized training tailored to my individual needs and current fitness level. Please include details on your rates and any introductory packages you might offer for new clients.',
      'email': 'fitcoach@lifestyle.com',
    },
  ];
  void _deleteItem(int index) {
    CustomSnackBar.show(
      snackPosition: SnackPosition.BOTTOM,
      context,
      'Inquiry Deleted Successfully!',
    );
    setState(() {
      inquiries.removeAt(index);
    });
  }

  void _showDetails(Map<String, String> item) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white,
        title: Text('${item['title']}', style: AppTextStyles.headingLarge),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message: ${item['message']}',
              style: AppTextStyles.bodyLargeGrey,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Service Inquiry'),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomSearchBarWidget(
              showFilter: false,
              hintText: 'Search Services',
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: inquiries.length,
              itemBuilder: (context, index) {
                final item = inquiries[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Service Title: ',
                              style: AppTextStyles.bodyLargeGrey.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            TextSpan(
                              text: item['title'],
                              style: AppTextStyles.bodyLarge.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        'Message:\n ${item['message']}',
                        style: AppTextStyles.bodyLargeGrey,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Email: ${item['email']}',
                        style: AppTextStyles.bodyLargeGrey,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                iconAlignment: IconAlignment.end,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.grey.shade600,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 12,
                                ),
                              ),
                              onPressed: () => _showDetails(item),
                              child: Text('Show'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 100,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                iconAlignment: IconAlignment.end,
                                backgroundColor: AppColors.themeColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 12,
                                ),
                              ),
                              onPressed: () => _deleteItem(index),
                              icon: const Icon(
                                FontAwesomeIcons.trash,
                                size: 14,
                              ),
                              label: const Text('Delete'),
                            ),
                          ),
                        ],
                      ),
                    ],
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
