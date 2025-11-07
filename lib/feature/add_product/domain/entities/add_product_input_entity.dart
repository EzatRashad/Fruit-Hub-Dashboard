class AddProductInputEntity {
   final String name;
  final String code;
  final String description;
  final num price;
  final String category;
  final String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.category,
      this.imageUrl,
  });


}

