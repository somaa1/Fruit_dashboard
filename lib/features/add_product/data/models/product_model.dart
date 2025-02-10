import 'dart:io';

import 'package:fruit_hub_dash/features/add_product/data/models/review_model.dart';
import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final num price;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths; //صلاحية
  bool isOrganic; //اورجانيك
  final int numberOfCalories;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.code,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.isOrganic,
    this.sellingCount = 0,
  });

  factory ProductModel.fromEntitiy(ProductEntity addProductInputEntity) {
    return ProductModel(
      name: addProductInputEntity.name,
      code: addProductInputEntity.code,
      price: addProductInputEntity.price,
      description: addProductInputEntity.description,
      image: addProductInputEntity.image,
      isFeatured: addProductInputEntity.isFeatured,
      imageUrl: addProductInputEntity.imageUrl,
      expirationsMonths: addProductInputEntity.expirationsMonths,
      numberOfCalories: addProductInputEntity.numberOfCalories,
      unitAmount: addProductInputEntity.unitAmount,
      isOrganic: addProductInputEntity.isOrganic,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'sellingCount': sellingCount,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
