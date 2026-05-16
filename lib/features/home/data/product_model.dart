class ProductModel {
  final String name;
  final String category;
  final String description;
  final double rating;
  final String imagePath;

  const ProductModel({
    required this.name,
    required this.description,
    required this.category,
    required this.rating,
    required this.imagePath,
  });
}
