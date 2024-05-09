
// ignore_for_file: unused_import

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/OrderHistory/historyModel.dart';
import 'package:main_project_/Model/OrderHistory/orderHisModel.dart';


class OrdersHistoryProvider extends ChangeNotifier {
  final service = OrderHistoryService();
  bool isloading = false;
  OrderHistory _orderHistory = OrderHistory();
  OrderHistory get orderHistory => _orderHistory;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _orderHistory = res;

    isloading = false;
    notifyListeners();
  }
}