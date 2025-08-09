import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactNowAlertDialogWidget extends StatelessWidget {
  const ContactNowAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // ───── Header with title and close button ─────
              _buildHeader(context),

              // ───── Divider ─────
              Divider(thickness: 1.5, color: Colors.grey.shade300),

              // ───── Input fields ─────
              _buildTextField(hint: 'Enter full name'),
              _buildTextField(hint: 'Enter your email'),
              _buildTextField(hint: 'Enter email subject'),
              _buildTextField(hint: 'Write your message', maxLines: 5),

              const SizedBox(height: 12),

              // ───── Submit button ─────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 50,
                  child: CustomButtonWidget(
                    text: 'Contact Now',
                    fontSize: 18,
                    onPressed: () {},
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the alert dialog header with title and close icon
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Contact Now',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(AssetsPath.cancelSvg, width: 22),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable method to build styled text fields
  Widget _buildTextField({required String hint, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
