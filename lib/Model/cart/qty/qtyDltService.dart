// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/CartModel/cartGet.dart';
import 'package:main_project_/Model/cart/addCart/cartDeleteService.dart';
import 'package:main_project_/Model/cart/addCart/cartService.dart';
import 'package:main_project_/Model/cart/addCart/deletaData.dart';
import 'package:main_project_/Model/cart/cartService.dart';
import 'package:main_project_/Model/cart/qty/qtyAdd.dart';
import 'package:main_project_/Model/cart/qty/qtyDlt.dart';

class DeleteDataService extends ChangeNotifier {
  final serviceDelete = DeleteDataCart();
  // bool isloading = false;
  // CartGet _cartModel = CartGet();
  // CartGet get cartModel => _cartModel;
  deleteData(id) async {
    // isloading = true;
    notifyListeners();
    await serviceDelete.DeleteData(id);
    // final res = await service.getAll(dynamic add);

    // _cartModel = res;
    // log(bannerModel.banner?[0].image ?? "");

    // isloading = false;
    // log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
