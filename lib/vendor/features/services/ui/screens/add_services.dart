// Keep your imports
import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_snack_bar_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:book_app/vendor/features/services/ui/widgets/custom_dotted_container.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  final QuillController _controller = QuillController.basic();
  String selectedLanguage = 'English';
  bool cloneEnglish = false;
  bool cloneArabic = false;

  String? filesName;
  String? imagesName;

  final List<String> languageOptions = [
    'English',
    'Arabic',
    'Spanish',
    'Bengali',
  ];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() => filesName = result.files.single.name);
    }
  }

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() => imagesName = result.files.single.name);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isArabic = selectedLanguage == 'Arabic';

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Add Services'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomHeaderTextWidget(text: 'Gallery Images*'),
                  const SizedBox(height: 12),
                  CustomDottedContainer(
                    text: filesName ?? 'Drag and drop files here to upload',
                    icon: AssetsPath.uploadSvg,
                    onTap: pickFile,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      textAlign: TextAlign.center,
                      'Please note that you can upload a maximum of 10 images',
                      style: AppTextStyles.bodyLargeGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const CustomHeaderTextWidget(text: 'Featured Image*'),
                  const SizedBox(height: 12),
                  CustomDottedContainer(
                    onTap: pickImage,
                    text: imagesName ?? 'No Image Found',
                    icon: AssetsPath.noCameraSvg,
                    showCircle: true,
                    showRectangle: false,
                    iconWidth: 60,
                    iconHeight: 60,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 52,
                    child: CustomButtonWidget(
                      text: 'Choose Image',
                      onPressed: pickImage,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // ───── Language Selector ─────
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

                  // ───── Language Based Form ─────
                  Directionality(
                    textDirection: isArabic
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Column(
                      children: [
                        const CustomTextField(headerText: 'Title*'),
                        const SizedBox(height: 16),
                        const CustomTextField(headerText: 'Category*'),
                        const SizedBox(height: 16),
                        const CustomTextField(headerText: 'Sub Category'),
                        const SizedBox(height: 16),
                        const CustomTextField(headerText: 'Address'),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            Expanded(
                              child: CustomTextField(headerText: 'Latitude*'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: CustomTextField(headerText: 'Longitude*'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 52,
                          child: CustomButtonWidget(
                            fontSize: 18,
                            text: 'Show Map',
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 24),
                        const CustomTextField(
                          headerText: 'Features',
                          hintText: 'Enter Features',
                          maxLine: 4,
                        ),
                        const SizedBox(height: 24),
                        const FormHeaderTextWidget(
                          text: 'Description*',
                          fontSize: 16,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              QuillSimpleToolbar(
                                controller: _controller,
                                config: const QuillSimpleToolbarConfig(
                                  showLink: false,
                                  showSearchButton: false,
                                  showDividers: false,
                                  showIndent: false,
                                  showSubscript: false,
                                  showSuperscript: false,
                                  showInlineCode: false,
                                ),
                              ),
                              Container(
                                height: 160,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: QuillEditor.basic(
                                  controller: _controller,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const CustomTextField(
                          headerText: 'Meta keywords',
                          hintText: 'Enter Meta Keywords',
                        ),
                        const SizedBox(height: 24),
                        const CustomTextField(
                          headerText: 'Meta Description',
                          hintText: 'Enter Meta Description',
                          maxLine: 4,
                        ),
                        const SizedBox(height: 24),

                        // Clone checkbox
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

                  const SizedBox(height: 24),
                  SizedBox(
                    height: 52,
                    child: CustomButtonWidget(
                      fontSize: 18,
                      text: 'Submit Service',
                      onPressed: () {
                        CustomSnackBar.show(context, 'Service Adding Request Submitted!');
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
