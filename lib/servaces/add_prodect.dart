import 'package:store_app/models/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class AddProdect {
  Future<ProdectModel> addProduct({
    required String title,
    required String image,
    required String category,
    required double price,
    required String description,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://fakestoreapi.com/products",
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

