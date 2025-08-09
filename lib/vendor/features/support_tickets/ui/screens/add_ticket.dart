import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:book_app/common/ui/widgets/custom_text_field.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  final QuillController _controller = QuillController.basic();
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        fileName = result.files.single.name;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'Add a Ticket'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextField(
                      headerText: 'Email Address*',
                      hintText: 'yourmail@example.com',
                    ),
                    const SizedBox(height: 16),
                    const CustomTextField(
                      headerText: 'Subject*',
                      hintText: 'Enter Subject',
                    ),
                    const SizedBox(height: 16),
                    const FormHeaderTextWidget(
                      text: 'Description*',
                      fontSize: 16,
                    ),
                    const SizedBox(height: 4),

                    // ── Quill Editor ──
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: QuillSimpleToolbar(
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
                          ),
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: QuillEditor.basic(controller: _controller),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),
                    CustomHeaderTextWidget(
                      text: 'Attachment',
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
                              fileName ?? 'No file chosen',
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
                    const SizedBox(height: 8),
                    const Text(
                      'Upload only ZIP Files, Max File Size is 20 MB',
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: CustomButtonWidget(
                        text: 'Save',
                        onPressed: () {
                          CustomSnackBar.show(
                            snackPosition: SnackPosition.TOP,
                            context,
                            'Support Ticket Created Successfully!',
                          );
                        },
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
