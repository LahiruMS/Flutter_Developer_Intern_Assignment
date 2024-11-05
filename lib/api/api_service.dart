import 'dart:convert';

import 'package:flutter_developer_intern_assignment/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Product>> fetchAllProducts() async {
    const String url = "https://api.npoint.io/a907f54f4d95e9e31711";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        return responseData.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception(
            "Failed to fetch products. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to fetch products: $error");
    }
  }

  Future<Product> fetchSingleProduct() async {
    const String url = "https://api.npoint.io/7fe4c3d8d85298ece626";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            "Failed to fetch product. Status code: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed to fetch product: $error");
    }
  }
}
