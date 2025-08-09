import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_dotted_container.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_toggle_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  // State variables for form fields
  String? status;
  bool showEmail = false;
  bool showPhone = false;
  bool showInfo = false;
  bool isServiceEnabled = true;
  String selectedLanguage = 'English';
  bool cloneEnglish = false;
  bool cloneArabic = false;
  String? imagesName;

  // List of available language options
  final List<String> languageOptions = [
    'English',
    'Arabic',
    'Spanish',
    'Bengali',
  ];

  // Method to handle image picking using file_picker package
  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        imagesName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the selected language is Arabic for text direction
    final bool isArabic = selectedLanguage == 'Arabic';

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Add Staff'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Widget for selecting staff image
                  CustomDottedContainer(
                    icon: AssetsPath.noCameraSvg,
                    text: imagesName ?? 'No Image Found',
                    onTap: pickImage,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 52,
                    child: CustomButtonWidget(
                      fontSize: 16,
                      text: 'Choose Image',
                      onPressed: pickImage,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Row containing Email and Phone text fields
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          headerText: 'Email*',
                          hintText: 'Enter Email',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(
                          headerText: 'Phone*',
                          hintText: 'Enter Phone',
                        ),
                      ),
                    ],
                  ),
                  // Checkboxes to show/hide contact info
                  Row(
                    children: [
                      Expanded(
                        child: _buildCheckbox("Show Email", showEmail, (val) {
                          setState(() => showEmail = val!);
                        }),
                      ),
                      Expanded(
                        child: _buildCheckbox("Show Phone", showPhone, (val) {
                          setState(() => showPhone = val!);
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Dropdown for staff status
                  _buildDropdownField(
                    ["Active", "Inactive"],
                    status,
                        (value) => setState(() => status = value),
                  ),
                  // Checkbox to show/hide staff information
                  _buildCheckbox("Show Information", showInfo, (val) {
                    setState(() => showInfo = val!);
                  }),
                  const SizedBox(height: 12),
                  // Order number text field and description
                  CustomTextField(
                    headerText: 'Order Number*',
                    hintText: 'Enter Order Number',
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "The higher the order number is, the later the staff will be shown.",
                    style: TextStyle(color: AppColors.themeColor, fontSize: 12),
                  ),
                  const SizedBox(height: 12),
                  // Toggle button for 'Allow Login'
                  const FormHeaderTextWidget(text: 'Allow Login'),
                  const SizedBox(height: 4),
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
                  const SizedBox(height: 12),
                  // Username and Password fields shown conditionally
                  if (isServiceEnabled)
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            headerText: 'Username*',
                            hintText: 'Enter Username',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            headerText: 'Password*',
                            hintText: 'Enter Password',
                          ),
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),

                  // Language Selector section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: languageOptions.map((lang) {
                        final bool isSelected = selectedLanguage == lang;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => selectedLanguage = lang),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: isSelected
                                  ? AppColors.themeColor
                                  : Colors.white,
                              child: SizedBox(
                                width: 100,
                                height: 45,
                                child: Center(
                                  child: Text(
                                    lang,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Language-based form with dynamic text direction
                  Directionality(
                    textDirection: isArabic
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Column(
                      children: [
                        // Name and Address fields
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                headerText: 'Name*',
                                hintText: 'Enter Name',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: CustomTextField(
                                headerText: 'Address',
                                hintText: 'Enter Address',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // 'Show Map' button
                        SizedBox(
                          height: 52,
                          child: CustomButtonWidget(
                            fontSize: 16,
                            text: 'Show Map',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Information text field
                        CustomTextField(
                          maxLine: 4,
                          headerText: 'Information',
                          hintText: 'Enter Short Description',
                        ),
                        const SizedBox(height: 16),

                        // Clone Checkbox for language translation
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Checkbox(
                                value: isArabic ? cloneArabic : cloneEnglish,
                                onChanged: (val) {
                                  setState(() {
                                    if (isArabic) {
                                      cloneArabic = val ?? false;
                                    } else {
                                      cloneEnglish = val ?? false;
                                    }
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'Clone for '),
                                    TextSpan(
                                      text: isArabic ? 'English' : 'عربي',
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const TextSpan(text: ' language'),
                                  ],
                                ),
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Submit button to save the staff member
                  SizedBox(
                    height: 52,
                    child: CustomButtonWidget(
                      fontSize: 16,
                      text: 'Submit',
                      onPressed: () {
                        // Show a snack bar on submission
                        CustomSnackBar.show(
                          context,
                          'Staff Adding Request is Submitted',
                          snackPosition: SnackPosition.TOP,
                        );
                      },
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

  // A reusable widget to build a dropdown form field
  Widget _buildDropdownField(
      List<String> items,
      String? value,
      ValueChanged<String?> onChanged,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeaderTextWidget(text: 'Status*', fontSize: 16),
        const SizedBox(height: 8),
        Container(
          height: 56,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Text('Select Status'),
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.white,
              value: value,
              onChanged: onChanged,
              items: items
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  // A reusable widget to build a labeled checkbox
  Widget _buildCheckbox(
      String label,
      bool value,
      ValueChanged<bool?> onChanged,
      ) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        Expanded(child: Text(label)),
      ],
    );
  }
}