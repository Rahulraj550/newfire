import 'package:http/http.dart'as http;

import "../model/product_model.dart";class HttpService {


  static Future<List<Welcome>> fetchProductus() async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      var data = response.body;
      return welcomeFromJson(data);
    } else {
      throw Exception();
    }
  }
}