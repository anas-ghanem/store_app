import 'package:store_app/models/helper/Api.dart';
import 'package:store_app/models/prodect_model.dart';

class UpdateProduct {

  Future<ProdectModel> updateProduct({
    required String title,
    required String image,
    required String category,
    required int id,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: "https://fakestoreapi.com/products/$id",
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