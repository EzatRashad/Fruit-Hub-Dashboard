import 'dart:io';

import 'package:frut_hub_dashboard/feature/add_product/data/models/review_model.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final String category;
  String? imageUrl;
  final File image;
  final int sellingCount;
  final int expiryMonths;
  final bool isOrganic;
  final bool isFeatured;
  final int numOfCalories;
  final num ratingCount;
  final num averageRating;
  final List<ReviewModel> reviews;

  final int stockQuantity;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
    required this.isFeatured,
    this.isOrganic = false,
    this.sellingCount = 0,
    this.imageUrl,
    required this.reviews,
    required this.image,
    required this.expiryMonths,
    required this.numOfCalories,
    required this.ratingCount,
    required this.averageRating,
    required this.stockQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
      isOrganic: json['isOrganic'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      image:
          File(''), // Placeholder, as File cannot be created from JSON directly
      expiryMonths: json['expiryMonths'],
      numOfCalories: json['numOfCalories'],
      ratingCount: json['ratingCount'],
      averageRating: json['averageRating'],
      stockQuantity: json['stockQuantity'],
    );
  }

    ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      category: category,
      isOrganic: isOrganic,
      image: image,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expiryMonths: expiryMonths,
      numOfCalories: numOfCalories,
      isFeatured: isFeatured,
      stockQuantity: stockQuantity,
    );
  }
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
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
      'sellingCount': sellingCount,
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
