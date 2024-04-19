// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:main_project_/CommonWidget/ip.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartGetPro extends ChangeNotifier {
//   final List<CartItem> items;

//   CartGetPro({required this.items});

//   factory CartGetPro.fromJson(Map<String, dynamic> json) {
//     List<dynamic> cartItemsJson = json['items'];
//     List<CartItem> cartItems = cartItemsJson.map((itemJson) => CartItem.fromJson(itemJson)).toList();

//     return CartGetPro(items: cartItems);
//   }

//   Future<void> fetchCart() async {
//     try {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       final token = pref.getString('token');
//       log('Token: $token');

//       final response = await http.get(
//         Uri.parse('http://$ip:3000/flutter/cart'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         log("Cart ${response.statusCode}");
//         log("Cart ${response.body}");
//         log("message");

//         final responseData = json.decode(response.body);
//         final cartItem = CartGetPro.fromJson(responseData);

//         log('$cartItem');
//       } else {
//         log("Failed to fetch cart: ${response.statusCode}");
//       }
//     } catch (e) {
//       log("Error: $e");
//     }
//   }
// }

// class CartItem {
//   final String id;
//   final String name;
//   final double price;

//   CartItem({required this.id, required this.name, required this.price});

//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       id: json['id'],
//       name: json['name'],
//       price: json['price'].toDouble(),
//     );
//   }
// }
