import 'package:book_app/app/assets_path.dart';

class CategoryListModel {
  final String images;
  final String title;

  CategoryListModel({required this.images, required this.title});
}

List<CategoryListModel> dummyCategoryList = [
  CategoryListModel(images: AssetsPath.categorySvg3, title: 'Doctor'),
  CategoryListModel(images: AssetsPath.categorySvg2, title: 'Plumber'),
  CategoryListModel(images: AssetsPath.categorySvg4, title: 'Cleaning'),
  CategoryListModel(images: AssetsPath.categorySvg1, title: 'Car Wash'),
];
