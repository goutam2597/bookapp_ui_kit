import 'dart:io';

import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_app_bar.dart';
import 'package:book_app/common/ui/widgets/custom_button_widget.dart';
import 'package:book_app/common/ui/widgets/form_header_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _imageFile;

  final Map<String, TextEditingController> _controllers = {
    'username': TextEditingController(text: "james_123"),
    'name': TextEditingController(text: "James Rodrigo"),
    'email': TextEditingController(text: "james@example.com"),
    'phone': TextEditingController(text: "+1 (195) 312-1866"),
    'state': TextEditingController(text: "Ontario"),
    'zip': TextEditingController(text: "75820"),
    'country': TextEditingController(text: "United States"),
    'address': TextEditingController(
      text: "123 Queen Street West, Toronto, Ontario",
    ),
  };

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Edit profile'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildProfileImage(),
                  const SizedBox(height: 32),
                  _buildTextField('Username', 'Enter user name', 'username'),
                  _buildTextField('Name', 'Enter your name', 'name'),
                  _buildTextField('Email', 'Enter email address', 'email'),
                  _buildTextField('Phone', 'Enter phone number', 'phone'),
                  _buildTextField('State', 'Enter your state', 'state'),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          'Postcode/Zip',
                          'Enter Zip/post code',
                          'zip',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildTextField(
                          'Country',
                          'Enter your country',
                          'country',
                        ),
                      ),
                    ],
                  ),
                  _buildTextField('Address', 'Enter your address', 'address'),
                  SizedBox(
                    height: 50,
                    child: CustomButtonWidget(
                      text: 'Update Profile',
                      onPressed: () {
                        // TODO: Add update logic
                      },
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the profile avatar with dynamic image and camera picker
  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : const AssetImage(AssetsPath.userPlaceholderPng)
                      as ImageProvider,
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade100,
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.colorText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reusable form field builder
  Widget _buildTextField(String header, String hint, String key) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormHeaderTextWidget(text: header),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: TextField(
            controller: _controllers[key],
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: AppColors.colorText),
            ),
          ),
        ),
      ],
    );
  }
}
