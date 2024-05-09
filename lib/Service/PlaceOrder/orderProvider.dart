import 'package:flutter/material.dart';
import 'package:main_project_/Model/OrderHistory/model.dart';

class OrderCreationProvider extends ChangeNotifier {
  late OrderModel _orderCreation = OrderModel(); // Initialize with default value
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  OrderModel get orderCreation => _orderCreation;

  void createOrder(OrderModel orderCreation) {
    _orderCreation = orderCreation;
    notifyListeners();
  }
}
