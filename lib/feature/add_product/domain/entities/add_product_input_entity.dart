import 'dart:io';

class AddProductInputEntity {
   final String name;
  final String code;
  final String description;
  final num price;
  final String category;
   String? imageUrl;
  final File image;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
      this.imageUrl,
    required this.image,
  });


}

