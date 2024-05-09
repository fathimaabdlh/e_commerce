// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations, unused_import
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/CartModel/cartGet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteDataCart {
  Future<void> DeleteData(dynamic addData) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      final response = await http.get(
        Uri.parse('http://${ip}:3000/flutter/cart/quantityminus/${addData}'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // log('${response.body}');
      // log('${response.headers}');
      if (response.statusCode == 200) {
        log("wertyuiowwwwwwwwwwwwwwwwwwwwwwwwww");
        log("uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu${response.body}");
        // log('successful');
        // log('${response.body}');

        // return CartGet.fromJson(json.decode(response.body));
      }
    } catch (e) {
      log("erorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    }
    // return CartGet();
  }
}
