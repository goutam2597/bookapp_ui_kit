import 'dart:io';

import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class StaffEditProfileScreen extends StatefulWidget {
  const StaffEditProfileScreen({super.key});

  @override
  State<StaffEditProfileScreen> createState() => _StaffEditProfileScreenState();
}

class _StaffEditProfileScreenState extends State<StaffEditProfileScreen> {
  final List<String> languageTabs = ['English', 'Arabic', 'Spanish', 'Bengali'];
  String selectedLanguage = 'English';

  File? imageFile;

  bool showEmail = true;
  bool showPhone = true;
  bool showContactForm = true;
  bool cloneLanguage = false;

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imageFile = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = selectedLanguage == 'Arabic';

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Edit Profile'),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeaderTextWidget(text: 'Photo'),
                  const SizedBox(height: 8),
                  Center(
                    child: GestureDetector(
                      onTap: pickImage,
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          color: Colors.grey.shade300,
                          dashPattern: [15, 10],
                          strokeWidth: 1.5,
                          padding: EdgeInsets.zero,
                          radius: const Radius.circular(8),
                        ),
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image:
                                (imageFile != null && imageFile!.existsSync())
                                ? DecorationImage(
                                    image: FileImage(imageFile!),
                                    fit: BoxFit.fill,
                                  )
                                : null,
                          ),
                          child: (imageFile == null || !imageFile!.existsSync())
                              ? Center(
                                  child: SvgPicture.asset(
                                    AssetsPath.noCameraSvg,
                                    width: 60,
                                    height: 60,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
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
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Image Size 80*80',
                      style: AppTextStyles.bodyLargeGrey,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // ───── Username, Email, Phone Fields ─────
                  const CustomTextField(
                    headerText: 'Username*',
                    hintText: 'James',
                  ),
                  buildCheckbox('Show Email Address', showEmail, (val) {
                    setState(() => showEmail = val ?? false);
                  }),
                  const SizedBox(height: 12),

                  const CustomTextField(
                    headerText: 'Email*',
                    hintText: 'yourmail@mail.com',
                  ),
                  buildCheckbox('Show Phone Number', showPhone, (val) {
                    setState(() => showPhone = val ?? false);
                  }),
                  const SizedBox(height: 12),

                  const CustomTextField(
                    headerText: 'Phone',
                    hintText: '+1 985 2561 562',
                  ),
                  buildCheckbox('Show Contact Form', showContactForm, (val) {
                    setState(() => showContactForm = val ?? false);
                  }),
                  const SizedBox(height: 20),

                  // ───── Language Tabs ─────
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: languageTabs.map((lang) {
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

                  const SizedBox(height: 24),

                  // ───── Language Based Form ─────
                  Directionality(
                    textDirection: isArabic
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(
                              child: CustomTextField(headerText: 'Name*'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(headerText: 'Country'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: CustomTextField(headerText: 'City'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(headerText: 'State'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: CustomTextField(headerText: 'Zip Code'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(headerText: 'Address'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 52,
                          child: CustomButtonWidget(
                            fontSize: 16,
                            text: 'Show Map',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 16),
                        const CustomTextField(
                          headerText: 'Details',
                          hintText: 'Enter Details',
                          maxLine: 5,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // ───── Clone Checkbox ─────
                  Row(
                    children: [
                      Checkbox(
                        value: cloneLanguage,
                        onChanged: (val) =>
                            setState(() => cloneLanguage = val ?? false),
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

                  const SizedBox(height: 24),
                  SizedBox(
                    height: 52,
                    child: CustomButtonWidget(
                      fontSize: 16,
                      text: 'Update Profile',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile Updated!')),
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

  /// Reusable Checkbox Widget
  Widget buildCheckbox(String text, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.1,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.themeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: Colors.grey),
          ),
        ),
        Text(
          text,
          style: AppTextStyles.bodyLarge.copyWith(color: Colors.grey.shade700),
        ),
      ],
    );
  }
}
