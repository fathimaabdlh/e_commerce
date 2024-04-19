// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/CartModel/cartGet.dart';
import 'package:main_project_/Model/cart/addCart/cartDeleteService.dart';
import 'package:main_project_/Model/cart/addCart/cartService.dart';
import 'package:main_project_/Model/cart/addCart/deletaData.dart';
import 'package:main_project_/Model/cart/cartService.dart';
import 'package:main_project_/Model/cart/qty/qtyAdd.dart';

class  AddDataService extends ChangeNotifier {
  final serviceAdd = AddDataCart();
  // bool isloading = false;
  // CartGet _cartModel = CartGet();
  // CartGet get cartModel => _cartModel;
  addData(id) async {
    
    // isloading = true;
    notifyListeners();
    await serviceAdd.AddData(id);
    // final res = await service.getAll(dynamic add);

    // _cartModel = res;
    // log(bannerModel.banner?[0].image ?? "");

    // isloading = false;
    // log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
