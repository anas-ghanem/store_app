import 'package:store_app/models/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class UpdateProduct {
  Future<ProdectModel> updateProduct({
    required String title,
    required String description,
    required String image,
    required String category,
    required double price,
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
      body: {
        "title": title,
        "image": image,
        "price": price,
        "description": description,
        "category": category,
      },
    );

    return ProdectModel.fromJson(data);
  }
}
