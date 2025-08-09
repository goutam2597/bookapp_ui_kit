import 'package:book_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [_buildHeaderBackground(), _buildSearchBar()],
    );
  }

  /// Top background image with texts
  Widget _buildHeaderBackground() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(AssetsPath.topBGPng),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTag(),
            const SizedBox(height: 16),
            const Text(
              'All Your Services in \nBookapp Platform',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Tagline badge widget
  Widget _buildTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(99),
        borderRadius: BorderRadius.circular(48),
      ),
      child: const Text(
        '24/7 service available',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  /// Search input field widget (floating)
  Widget _buildSearchBar() {
    final borderRadius = BorderRadius.circular(52);
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade100, width: 1.5),
      borderRadius: borderRadius,
    );

    return Positioned(
      bottom: -25,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.white,
        elevation: 1,
        borderRadius: borderRadius,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                AssetsPath.searchIconSvg,
                height: 16,
                width: 16,
              ),
            ),
            hintText: 'Search for services',
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
          ),
        ),
      ),
    );
  }
}
