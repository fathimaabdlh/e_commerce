// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/Wishlist/wishListModel.dart';
import 'package:main_project_/Model/Wishlist/wish_list/wish_list.dart';

class ViewWishListProvider extends ChangeNotifier {
  final service = WishListService();
  bool isloading = false;
  WishList _wishList = WishList();
  WishList get wishList => _wishList;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();

    _wishList = res;
    // log(bannerModel.banner?[0].image ?? "");

    isloading = false;
    // log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
