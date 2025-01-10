import 'dart:convert';
import 'package:http/http.dart'as http;

class FakestoreService {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<String>> getMainCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body);
      List<String> mainCategories = categoriesJson.map((categoryJson) =>
          categoryJson.toString()).toList();
      return mainCategories;
    } else {
      throw Exception('failed to load main categories');
    }
  }


  Future<List<Map<String, dynamic>>> getProductsByCategories(
      String category) async {
    final response = await http.get(
        Uri.parse('$baseUrl/products/category/$category'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('failure $category');
    }
  }

}