import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:store_app/models/helper/Api.dart';
import 'package:store_app/models/prodect_model.dart';

class GetallProdect {
  Future< List<ProdectModel>> getallprodect() async {
    List <dynamic> data = await Api().getData(
      url: 'https://fakestoreapi.com/products',
    );
    
    List<ProdectModel> prodectList = [];
    for (var i = 0; i <data.length; i++) {
      prodectList.add(ProdectModel.fromJson(data[i]));
    }
    return prodectList;
  }
}
