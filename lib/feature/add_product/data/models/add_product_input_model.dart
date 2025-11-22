import 'dart:io';

import 'package:frut_hub_dashboard/feature/add_product/data/models/review_model.dart';

import '../../domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final String category;
  String? imageUrl;
  final File image;
  final int expiryMonths;
  final bool isOrganic;
  final bool isFeatured;
  final int numOfCalories;
  final num ratingCount;
  final num averageRating;
  final List<ReviewModel> reviews;

  final int stockQuantity;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
    required this.isFeatured,
    this.isOrganic = false,
    this.imageUrl,
    required this.reviews,
    required this.image,
    required this.expiryMonths,
    required this.numOfCalories,
    required this.ratingCount,
    required this.averageRating,
    required this.stockQuantity,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      category: entity.category,
      isOrganic: entity.isOrganic,
      isFeatured: entity.isFeatured,
      imageUrl: entity.imageUrl,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      image: entity.image,
      expiryMonths: entity.expiryMonths,
      numOfCalories: entity.numOfCalories,
      ratingCount: entity.ratingCount,
      averageRating: entity.averageRating,
      stockQuantity: entity.stockQuantity,
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'category': category,
      'isFeatured': isFeatured,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'imageUrl': imageUrl,
      'expiryMonths': expiryMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'stockQuantity': stockQuantity
    };
  }
}
