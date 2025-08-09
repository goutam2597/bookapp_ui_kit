import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class StaffPluginsScreen extends StatefulWidget {
  const StaffPluginsScreen({super.key});

  @override
  State<StaffPluginsScreen> createState() => _StaffPluginsScreenState();
}

class _StaffPluginsScreenState extends State<StaffPluginsScreen> {
  String? jsonFileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        jsonFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Plugins'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: const CustomHeaderTextWidget(
                        text: 'Google Calender',
                      ),
                    ),
                    const SizedBox(height: 24),
                    const CustomHeaderTextWidget(
                      text: 'Upload Your File*',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              clipBehavior: Clip.none,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: pickFile,
                              child: FittedBox(
                                child: Text(
                                  'Choose File',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: Text(
                              jsonFileName ?? 'No file chosen',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(headerText: 'Client ID*'),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 52,
                      child: CustomButtonWidget(
                        text: 'Update',
                        onPressed: () {
                          CustomSnackBar.show(
                            snackPosition: SnackPosition.TOP,
                            context,
                            'Calendar info updated successfully!',
                          );
                        },
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
