class Product {
  final String? id;
  final String price;
  final String title;
  final String image;
  final double rating;
  final String description;

  Product({
    this.id,
    required this.price,
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['images'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'images': image,
      'rating': rating,
    };
  }
}
