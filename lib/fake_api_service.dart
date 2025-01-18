import 'dart:convert';

import 'package:api_calling/model/product_model.dart';
import 'package:http/http.dart' as http;

class FakeApiService {
  Future<List<ProductModel>> getProducts() async {
    try {
      var result =
          await http.get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
      if (result.statusCode == 200) {
        List<dynamic> convertBody = json.decode(result.body);
        var productList = convertBody
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        return productList;
      }
      return List<ProductModel>.empty();
    } catch (e) {
      return List<ProductModel>.empty();
    }
  }
}
