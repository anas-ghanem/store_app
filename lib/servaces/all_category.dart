import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/helper/Api.dart';

class AllCategory {
  Future<List<dynamic>> getallcategory() async {
   List <dynamic> data= await Api().getData(
      url: 'https://fakestoreapi.com/products/categories',
    );
    return data;
  }
}
