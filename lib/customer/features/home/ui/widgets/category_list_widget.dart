import 'package:book_app/customer/features/home/data/models/category_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(right: 16),
      itemCount: dummyCategoryList.length,
      itemBuilder: (context, index) {
        final item = dummyCategoryList[index];
        return Padding(
          padding: EdgeInsets.only(left: index == 0 ? 16 : 8),
          child: _buildCategoryItem(item),
        );
      },
    );
  }

  /// Builds a single category card
  Widget _buildCategoryItem(CategoryListModel item) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(item.images, height: 40, width: 40),
          const SizedBox(height: 8),
          Text(item.title, style: TextStyle(color: Colors.grey.shade700)),
        ],
      ),
    );
  }
}
