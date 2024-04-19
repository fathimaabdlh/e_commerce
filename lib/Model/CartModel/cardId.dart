// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:main_project_/CommonWidget/ip.dart';
// import 'package:main_project_/Model/CartModel/cartGet.dart';
// import 'package:main_project_/Model/CartModel/cartProvider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Fathima extends ChangeNotifier {
//   final service = CartItemPassProvider();
//   bool isLoading = false;
//   CartGet _cartGet = CartGet();
//   CartGet get cartGet => _cartGet;
//   getAllpost() async {
//     isLoading = true;
//     notifyListeners();
//     final res = await service.fetchCart();
//     _cartGet = res;
//     isLoading = false;
//     notifyListeners();
//   }
// }

// class CartItemPassProvider {
//   Future<CartGet> fetchCart() async {
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
//       return CartGet.fromJson(json.decode(response.body));
//     } catch (e) {
//       log("Error: $e");
//     }
//     return CartGet();
//   }

//   //  Future<void> fetchCart2() async {
//   //   try {
//   //     SharedPreferences pref = await SharedPreferences.getInstance();
//   //     final token = pref.getString('token');
//   //     log('Token: $token');

//   //     final response = await http.get(
//   //       Uri.parse('http://$ip:3000/flutter/cart'),
//   //       headers: {
//   //         'Authorization': 'Bearer $token',
//   //         'Content-Type': 'application/json; charset=UTF-8',
//   //       },
//   //     );

//   //     if (response.statusCode == 200) {
//   //       log("Cart ${response.statusCode}");
//   //       log("Cart ${response.body}");
//   //       log("message");

//   //       final responseData = json.decode(response.body);
//   //       final cartItem = CartGetPro.fromJson(responseData);

//   //       log('$cartItem');
//   //     } else {
//   //       log("Failed to fetch cart: ${response.statusCode}");
//   //     }
//   //   } catch (e) {
//   //     log("Error: $e");
//   //   }
//   // }
//   Future<void> addItemToCart(dynamic add) async {
//     try {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       final token = pref.getString('token');
//       log('Token: $token');

//       final response = await http.get(
//         Uri.parse('http://$ip:3000/flutter/cart/quantityadd/$add'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         log("fathimaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//         // BlocProvider.of<CartGetBloc>(context).add(CartFetch());
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> removeItemFromCart(dynamic remove) async {
//     try {
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       final token = pref.getString('token');
//       log('Token: $token');

//       final response = await http.get(
//         Uri.parse('http://$ip:3000/flutter/cart/quantityminus/$remove'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         // BlocProvider.of<CartGetBloc>(context).add(CartFetch());
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
