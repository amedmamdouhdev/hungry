class CartModel {
  final String name;
  final String description;
  final String imagePath;
  final int quantity;
  final double price;

  const CartModel({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.quantity,
    this.price = 33.06,
  });
}
