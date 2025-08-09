import 'package:book_app/app/app_colors.dart';
import 'package:book_app/app/assets_path.dart';
import 'package:book_app/common/ui/widgets/custom_search_bar_widget.dart';
import 'package:book_app/customer/features/services/ui/widgets/price_range_slider.dart';
import 'package:book_app/customer/features/services/ui/widgets/sort_by_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAlertDialog extends StatefulWidget {
  final List<String> categories;
  final List<String> ratings;

  const CustomAlertDialog({
    super.key,
    this.categories = const ['Electronics', 'Fashion', 'Cleaning', 'Medical'],
    this.ratings = const ['All', '5', '4', '3', '2', '1'],
  });

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  String? selectedCategory;
  String? selectedRating;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      content: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        Divider(thickness: 1.5, color: Colors.grey.shade300),
        _buildSectionTitle('Search by Product:'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomSearchBarWidget(
            showFilter: false,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        _buildSectionTitle('Categories:'),
        _buildHorizontalItemList(
          widget.categories,
          width: 120,
          selectedItem: selectedCategory,
          onSelect: (value) {
            setState(
              () => selectedCategory = value == selectedCategory ? null : value,
            );
          },
        ),
        _buildSectionTitle('Sort by:'),
        const SortByDropdownWidget(),
        const SizedBox(height: 16),
        _buildSectionTitle('Price Range:'),
        const PriceRangeSlider(),
        const SizedBox(height: 16),
        _buildSectionTitle('Ratings:'),
        _buildHorizontalItemList(
          widget.ratings,
          width: 80,
          isRating: true,
          selectedItem: selectedRating,
          onSelect: (value) {
            setState(
              () => selectedRating = value == selectedRating ? null : value,
            );
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Product Filters',
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.colorText,
        ),
      ),
    );
  }

  Widget _buildHorizontalItemList(
    List<String> items, {
    required double width,
    bool isRating = false,
    required String? selectedItem,
    required Function(String value) onSelect,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: items.map((item) {
          final bool isSelected = item == selectedItem;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelect(item),
              child: _buildSelectableItemCard(
                item,
                width,
                isRating,
                isSelected,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSelectableItemCard(
    String text,
    double width,
    bool isRating,
    bool isSelected,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: isSelected ? AppColors.themeColor : Colors.white,
      child: SizedBox(
        width: width,
        height: 50,
        child: Center(
          child: isRating
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber.shade600, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
