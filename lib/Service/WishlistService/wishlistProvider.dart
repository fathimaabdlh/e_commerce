// ignore_for_file: unused_field, prefer_final_fields
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/Wishlist/wish_list/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListProvider extends ChangeNotifier {
  Product? _wishData;
  bool _isLoading = false;

  // WishList? get wishListData =>  _Product;
  bool get isLoading => _isLoading;

  Future<void> fetchwishData() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = pref.getString('token');
      log('Token: $token');

      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/wishlist'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      log('Response Status Code: ${response.statusCode}');
      log('ansiiiiiiiiiiiiiiiiiiiiiiiiii');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        log('Response Body: $jsonData');

        _wishData = Product.fromJson(jsonData);
        notifyListeners();
      } else {
        throw Exception('Failed to load banner data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching banner data: $e');
      throw Exception('Error fetching banner data: $e');
    }
  }
}
