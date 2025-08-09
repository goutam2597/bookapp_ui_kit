import 'package:book_app/app/app_text_styles.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/custom_header_text_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../../common/ui/widgets/custom_snack_bar_widget.dart';
import '../../../../../common/ui/widgets/form_header_text_widget.dart';

class ConversationScreen extends StatefulWidget {
  final Map<String, String> tickets;

  const ConversationScreen({super.key, required this.tickets});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final QuillController _controller = QuillController.basic();
  String? attachment;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      setState(() {
        attachment = result.files.single.name;
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
      body: Column(
        children: [
          CustomAppBar(title: 'Ticket Details - ${widget.tickets['id']}'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomHeaderTextWidget(
                        text: widget.tickets['subject'] ?? '',
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ticket Status:',
                          style: AppTextStyles.bodyLargeGrey,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 24,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                (widget.tickets['status']?.toLowerCase() ==
                                    'open')
                                ? Colors.green
                                : (widget.tickets['status']?.toLowerCase() ==
                                      'closed')
                                ? Colors.red
                                : Colors.orange,
                          ),

                          child: Text(
                            '${widget.tickets['status']}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Time:', style: AppTextStyles.bodyLargeGrey),
                        Text(
                          widget.tickets['time'] ?? '',
                          style: AppTextStyles.bodyLargeGrey,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 52,
                      child: CustomButtonWidget(
                        text: 'Download Attachment',
                        onPressed: () {
                          CustomSnackBar.show(
                            context,
                            ' Attachment is Downloading',
                          );
                        },
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 24),
                    CustomHeaderTextWidget(text: 'Reply to Ticket'),
                    SizedBox(height: 16),
                    const FormHeaderTextWidget(
                      text: 'Description*',
                      fontSize: 16,
                    ),
                    SizedBox(height: 8),
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
                              attachment ?? 'No file chosen',
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
                        text: 'Message',
                        onPressed: () {
                          CustomSnackBar.show(
                            context,
                            ' Message Sent Successfully!',
                          );
                        },
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              'Replies',
                              style: AppTextStyles.headingLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    AssetsPath.staffPng1,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Admin',
                                        style: AppTextStyles.headingMedium,
                                      ),
                                      Text(
                                        'Super Admin',
                                        style: AppTextStyles.bodyLargeGrey,
                                      ),
                                      Text(
                                        'This is a message from admin',
                                        style: AppTextStyles.bodyLargeGrey,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    AssetsPath.staffPng1,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Admin',
                                        style: AppTextStyles.headingMedium,
                                      ),
                                      Text(
                                        'Super Admin',
                                        style: AppTextStyles.bodyLargeGrey,
                                      ),
                                      Text(
                                        'this is second message from admin with zip file',
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                        style: AppTextStyles.bodyLargeGrey,
                                      ),
                                      SizedBox(height: 4),
                                      SizedBox(
                                        width: 90,
                                        height: 28,
                                        child: CustomButtonWidget(
                                          text: 'Download',
                                          onPressed: () {
                                            CustomSnackBar.show(
                                              context,
                                              ' Attachment is Downloading',
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
