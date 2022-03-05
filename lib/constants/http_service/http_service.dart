import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rakibuddin560p/features/model/products_model.dart';

class HttpService {
  static Future<List<ProductModel>> fetchproducts() async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/men's clothing"));

    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  static Future<List<ProductModel>> fetchproductsWomen() async {
    var response = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/women's clothing"));

    if (response.statusCode == 200) {
      var data = response.body;
      return productModelFromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  static Future<String> fetchCategories() async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    if (response.statusCode == 200) {
      var data = response.body;

      return data;
    } else {
      throw Exception("Error");
    }
  }
}
