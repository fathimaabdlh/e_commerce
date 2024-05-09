// ignore_for_file: prefer_final_fields, file_names, unused_import
import 'dart:developer';import 'package:flutter/material.dart';
import 'package:main_project_/Model/Order/orderModel.dart';
import 'package:main_project_/Model/OrderHistory/model.dart';
import 'package:main_project_/Model/Placeorder/order_model/order_model.dart';



class OrderCreationProvider extends ChangeNotifier {
  OrderModel? _orderCreation;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  OrderModel? get orderCreation => _orderCreation;

  void createOrder(OrderModel orderCreation) {
    log('sarlllleeeeeeeeeee');

    _orderCreation = orderCreation;

    notifyListeners();
  }
}