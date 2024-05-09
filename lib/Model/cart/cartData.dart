// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/CartModel/cartGet.dart';
import 'package:main_project_/Model/cart/cartService.dart';

class CartData extends ChangeNotifier {
  final service = CartService();
  bool isloading = false;
  CartGet _cartModel = CartGet();
  CartGet get cartModel => _cartModel;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();

    _cartModel = res;
    // log(bannerModel.banner?[0].image ?? "");

    isloading = false;
    // log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
