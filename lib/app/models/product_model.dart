class ProductModel {
  String name;
  String description;
  double price;
  String image;
  List<String> ingredients;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.ingredients,
  });
}
