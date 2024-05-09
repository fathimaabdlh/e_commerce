// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/CartModel/cartGet.dart';
import 'package:main_project_/Model/Wishlist/wish_list/wish_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishListService {
  Future<WishList> getAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final response = await http.get(
      Uri.parse('http://${ip}:3000/flutter/wishlist'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      log("Request successful: ${response.body}");
      return WishList.fromJson(jsonDecode(response.body));
    } else {
      log("Request failed with status code: ${response.statusCode}");
      return WishList();
    }
  }
}
