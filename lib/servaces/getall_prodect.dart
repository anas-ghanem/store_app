import 'package:store_app/models/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class GetallProdect {
  Future<List<ProdectModel>> getallprodect() async {
    List<dynamic> data = await Api().getData(
      url: 'https://fakestoreapi.com/products',
    );

    List<ProdectModel> prodectList = [];
    for (var i = 0; i < data.length; i++) {
      prodectList.add(ProdectModel.fromJson(data[i]));
    }
    return prodectList;
  }
}

