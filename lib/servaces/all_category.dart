import 'package:store_app/models/helper/api.dart';

class AllCategory {
  Future<List<dynamic>> getallcategory() async {
    List<dynamic> data = await Api().getData(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}

