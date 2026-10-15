import 'package:store_app/models/helper/api.dart';
import 'package:store_app/models/prodect_model.dart';

class GetCategores {
  Future<List<ProdectModel>> getcategores({
    required String categoryName,
  }) async {
    List<dynamic> data = await Api().getData(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );

    List<ProdectModel> prodectList = [];
    for (var i = 0; i < data.length; i++) {
      prodectList.add(ProdectModel.fromJson(data[i]));
    }
    return prodectList;
  }
}

