import 'package:book_app/app/assets_path.dart';

class ShopCardModel {
  final String? email;
  final String images;
  final String name;
  final String address;
  final String serviceQty;

  ShopCardModel({
    this.email,
    required this.images,
    required this.name,
    required this.address,
    required this.serviceQty,
  });
}

List<ShopCardModel> dummyShopCardList = [
  ShopCardModel(
    email: 'jameswayne@store.com',
    images: AssetsPath.staffPng1,
    name: 'James Robert',
    address: 'City tower, Road : 1285, Usa',
    serviceQty: '12',
  ),
  ShopCardModel(
    email: 'jameswayne@store.com',
    images: AssetsPath.staffPng2,
    name: 'Ahmed Musa',
    address: 'City tower, Road : 1285, Usa',
    serviceQty: '54',
  ),
  ShopCardModel(
    email: 'jameswayne@store.com',
    images: AssetsPath.staffPng3,
    name: 'Jack Daniel',
    address: 'City tower, Road : 1285, Usa',
    serviceQty: '33',
  ),
  ShopCardModel(
    email: 'jameswayne@store.com',
    images: AssetsPath.staffPng4,
    name: 'Robert Smith',
    address: 'City tower, Road : 1285, Usa',
    serviceQty: '18',
  ),
];
