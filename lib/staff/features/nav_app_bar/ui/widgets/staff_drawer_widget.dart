import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/staff/features/plugins/ui/screens/staff_plugins_screen.dart';
import 'package:book_app/staff/features/service_inquiry/ui/screens/staff_service_inquiry.dart';
import 'package:book_app/staff/features/staff_appointment/ui/screens/staff_appointment_screen.dart';
import 'package:book_app/staff/features/change_password/ui/screens/change_staff_password.dart';
import 'package:book_app/staff/features/edit_profile/ui/screens/staff_edit_profile_screen.dart';
import 'package:book_app/staff/features/staff_services/ui/screens/staff_add_services.dart';
import 'package:book_app/staff/features/staff_services/ui/screens/staff_services_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../customer/features/nav_bar/bottom_nav_bar.dart';

class StaffDrawerWidget extends StatelessWidget {
  final Function(int index)? onScreenSelect;

  const StaffDrawerWidget({super.key, this.onScreenSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Drawer Header
          SizedBox(
            height: 160,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffEditProfileScreen(),
                  ),
                );
              },
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
                          'Lima Johnson',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Staff',
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
          ),

          // Drawer Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _switchTabTile(context, 'Dashboard', FontAwesomeIcons.gauge, 0),
                _expansionGroup(context, 'Services', FontAwesomeIcons.cube, {
                  'All Services': const StaffServicesScreen(),
                  'Add Services': const StaffAddServices(),
                }),
                _expansionGroup(
                  context,
                  'Appointments',
                  FontAwesomeIcons.calendarCheck,
                  {
                    'All Appointments': StaffAppointmentsScreen(),
                    'Pending Appointments': StaffAppointmentsScreen(),
                    'Accepted Appointments': StaffAppointmentsScreen(),
                    'Rejected Appointments': StaffAppointmentsScreen(),
                  },
                ),
                _pushTile(
                  context,
                  'Service Inquiry',
                  FontAwesomeIcons.solidComment,
                  const StaffServiceInquiry(),
                ),
                _pushTile(
                  context,
                  'Plugins',
                  FontAwesomeIcons.plug,
                  const StaffPluginsScreen(),
                ),
                _pushTile(
                  context,
                  'Edit Profile',
                  FontAwesomeIcons.userPen,
                  const StaffEditProfileScreen(),
                ),
                _pushTile(
                  context,
                  'Change Password',
                  FontAwesomeIcons.lock,
                  const ChangeStaffPassword(),
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
        onScreenSelect?.call(index);
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
              onScreenSelect?.call(entry.value as int);
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
