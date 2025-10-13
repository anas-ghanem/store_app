class ProdectModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final String image;
  final double price;
  final RatingModel rating;

  ProdectModel({
    required this.category,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProdectModel.fromJson(Map<String, dynamic> jsondata) {
    return ProdectModel(
      category: jsondata['category'],
      id: (jsondata['id'] as num).toInt(),
      title: jsondata['title'],
      description: jsondata['description'],
      image: jsondata['image'],
      price: (jsondata['price'] as num).toDouble(),
      rating: RatingModel.fromJson(jsondata['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsondata) {
    return RatingModel(
      rate: (jsondata['rate'] as num).toDouble(),
      count: (jsondata['count'] as num).toInt(),
    );
  }
}
