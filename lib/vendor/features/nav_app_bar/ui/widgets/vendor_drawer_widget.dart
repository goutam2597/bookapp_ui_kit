import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/vendor/features/appointments/ui/screens/appointments_settings.dart';
import 'package:book_app/vendor/features/appointments/ui/screens/vendor_appointments_screen.dart';
import 'package:book_app/vendor/features/buy_plan/ui/screens/buy_plan.dart';
import 'package:book_app/vendor/features/change_password/ui/screens/change_vendor_password.dart';
import 'package:book_app/vendor/features/edit_profile/ui/screens/vendor_edit_profile_screen.dart';
import 'package:book_app/vendor/features/email/ui/screens/recipient_mail.dart';
import 'package:book_app/vendor/features/plugins/ui/screens/plugins_screen.dart';
import 'package:book_app/vendor/features/service_inquiry/ui/screens/service_inquiry.dart';
import 'package:book_app/vendor/features/services/ui/screens/add_services.dart';
import 'package:book_app/vendor/features/services/ui/screens/vendor_services_screen.dart';
import 'package:book_app/vendor/features/staff/ui/screens/add_staff_screen.dart';
import 'package:book_app/vendor/features/staff/ui/screens/staff_screen.dart';
import 'package:book_app/vendor/features/subscription_log/ui/screens/subscription_log_screen.dart';
import 'package:book_app/vendor/features/support_tickets/ui/screens/add_ticket.dart';
import 'package:book_app/vendor/features/support_tickets/ui/screens/all_tickets.dart';
import 'package:book_app/vendor/features/transactions/ui/screens/transactions.dart';
import 'package:book_app/vendor/features/withdrawal/ui/screens/request_withdrawal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../customer/features/nav_bar/bottom_nav_bar.dart';

class VendorDrawerWidget extends StatelessWidget {
  final Function(int index)? onSelectScreen;

  const VendorDrawerWidget({super.key, this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header
          SizedBox(
            height: 160,
            child: DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.themeColor),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AssetsPath.staffPng1),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Leonardo da Vinci',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Vendor',
                        style: AppTextStyles.bodyLargeGrey.copyWith(
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _switchTabTile(context, 'Dashboard', FontAwesomeIcons.gauge, 0),
                _expansionGroup(context, 'Services', FontAwesomeIcons.cube, {
                  'All Services': const VendorServicesScreen(),
                  'Add Services': const AddServices(),
                }),
                _expansionGroup(
                  context,
                  'Staff Management',
                  FontAwesomeIcons.solidUser,
                  {
                    'All Staffs': const StaffScreen(),
                    'Add Staff': const AddStaffScreen(),
                  },
                ),
                _expansionGroup(
                  context,
                  'Appointments',
                  FontAwesomeIcons.calendarCheck,
                  {
                    'Settings': const AppointmentsSettings(),
                    'All Appointments': VendorAppointmentsScreen(),
                    'Pending Appointments': VendorAppointmentsScreen(),
                    'Accepted Appointments': VendorAppointmentsScreen(),
                    'Rejected Appointments': VendorAppointmentsScreen(),
                  },
                ),
                _pushTile(
                  context,
                  'Service Inquiry',
                  FontAwesomeIcons.solidComment,
                  const ServiceInquiry(),
                ),
                // _expansionGroup(
                //   context,
                //   'Withdrawal',
                //   FontAwesomeIcons.wallet,
                //   {
                //     'My Balance': const MyBalance(),
                //     'Request Withdrawal': const RequestWithdrawal(),
                //   },
                // ),
                _pushTile(
                  context,
                  'Request Withdrawal',
                  FontAwesomeIcons.wallet,
                  const RequestWithdrawal(),
                ),
                _pushTile(
                  context,
                  'Transactions',
                  FontAwesomeIcons.moneyBillTransfer,
                  const Transactions(),
                ),
                _pushTile(
                  context,
                  'Recipient Mail',
                  FontAwesomeIcons.solidEnvelope,
                  const RecipientMail(),
                ),
                _pushTile(
                  context,
                  'Plugins',
                  FontAwesomeIcons.plug,
                  const PluginsScreen(),
                ),
                _pushTile(
                  context,
                  'Subscription Log',
                  FontAwesomeIcons.chartSimple,
                  const SubscriptionLogScreen(),
                ),
                _expansionGroup(
                  context,
                  'Support Tickets',
                  FontAwesomeIcons.solidCircleQuestion,
                  {
                    'All Tickets': const AllTickets(),
                    'Add a Ticket': const AddTicket(),
                  },
                ),
                _pushTile(
                  context,
                  'Buy Plan',
                  FontAwesomeIcons.sackDollar,
                  const BuyPlan(),
                ),
                _pushTile(
                  context,
                  'Edit Profile',
                  FontAwesomeIcons.userPen,
                  const VendorEditProfileScreen(),
                ),
                _pushTile(
                  context,
                  'Change Password',
                  FontAwesomeIcons.lock,
                  const ChangeVendorPassword(),
                ),
              ],
            ),
          ),

          // Logout
          ListTile(
            leading: const Icon(
              FontAwesomeIcons.rightFromBracket,
              color: Colors.red,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _switchTabTile(
    BuildContext context,
    String title,
    IconData icon,
    int index,
  ) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Colors.grey.shade600),
      onTap: () {
        Navigator.pop(context);
        onSelectScreen?.call(index);
      },
    );
  }

  Widget _pushTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: Colors.grey.shade600),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
      },
    );
  }

  Widget _expansionGroup(
    BuildContext context,
    String title,
    IconData icon,
    Map<String, dynamic> items,
  ) {
    return ExpansionTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(title),
      children: items.entries.map((entry) {
        return ListTile(
          title: Text(entry.key),
          onTap: () {
            Navigator.pop(context);
            if (entry.value is int) {
              onSelectScreen?.call(entry.value as int);
            } else if (entry.value != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => entry.value),
              );
            }
          },
        );
      }).toList(),
    );
  }
}
