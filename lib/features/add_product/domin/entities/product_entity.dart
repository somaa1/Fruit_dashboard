import 'dart:io';

import 'package:fruit_hub_dash/features/add_product/domin/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String id;

  final num price;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths; //صلاحية
  bool isOrganic ; //اورجانيك
  final int numberOfCalories;
  final int unitAmount;
final num avgRating=0;
final num ratingCount=0;
final List<ReviewEntity> reviews;
  ProductEntity({
    required this.id,

    required this.reviews,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required  this.unitAmount,
    required this.code,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.isOrganic,

  });
}
