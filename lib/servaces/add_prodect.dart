import 'package:http/http.dart';
import 'package:store_app/models/helper/Api.dart';
import 'package:store_app/models/prodect_model.dart';

class AddProdect {
  Future<ProdectModel> addProduct({
    required String title,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: "https://fakestoreapi.com/products",
      body: {
        "title": title,
        "image": image,
        "price": "10.99",
        "description": "A great product",
        "category": "electronics",
      },
      
    );
    return ProdectModel.fromJson(data);
  }
}
