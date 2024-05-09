// ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, use_build_context_synchronously, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/CommonWidget/textfild.dart';
import 'package:main_project_/Model/OrderHistory/model.dart';
import 'package:main_project_/Service/PlaceOrder/orderProvider.dart';
import 'package:main_project_/View/HomePages/Chekout%20page/PaymentPage/payment.dart';
// import 'package:main_project_/View/HomePages/Chekout%20page/PaymentPage/payment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController paymentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Checkout",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            // Icon(Icon.ios-arrow-back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                textFild(
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    hintTxt: 'Name',
                    image: '',
                    controller: nameController),
                textFild(
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    hintTxt: 'phone',
                    image: '',
                    controller: phonenoController),
                textFild(
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    hintTxt: 'State',
                    image: '',
                    controller: stateController),
                textFild(
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    hintTxt: 'City',
                    image: '',
                    controller: cityController),
                textFild(
                    validator: (input) => input!.trim().isEmpty
                        ? 'Please enter a valid name'
                        : null,
                    hintTxt: 'Pin',
                    image: '',
                    controller: pinController),
                // textFild(
                //     validator: (input) =>
                //         input!.trim().isEmpty ? 'Please enter a valid name' : null,
                //     hintTxt: 'razorpay',
                //     image: '',
                //     controller: paymentController),
                TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        checkoutApi(
                          context,
                          nameController.text.toString(),
                          addressController.text.toString(),
                          phonenoController.text.toString(),
                          cityController.text.toString(),
                          stateController.text.toString(),
                          pinController.text.toString(),
                        );

                        // After performing actions, navigate to PaymentPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage()),
                        );
                      }
                    },
                    child: Text('Save'))
              ],
            ),
          ),
        ));
  }
}

Future<void> checkoutApi(
  BuildContext context,
  String name,
  String address,
  String phoneno,
  String city,
  String state,
  String pin,
  // String payment,
) async {
  log('hhhhhhhhhhhhhhhhhhhhhhh');
  SharedPreferences preferences = await SharedPreferences.getInstance();
  log('${preferences}');
  var token = await preferences.getStringList('token');

  var response = await post(
    Uri.parse("http://${ip}:3000/flutter/placeorder"),
    headers: <String, String>{
      "Authorization": "Bearer $token",
    },
    body: {
      'name': name,
      'address': address,
      'city': city,
      'phoneno': phoneno,
      'pincode': pin,
      'state': state,
      // 'paymentMethod': payment
    },
  );
  log(response.body);

  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    var orderModel = OrderModel.fromJson(json);

    Provider.of<OrderCreationProvider>(context, listen: false)
        .createOrder(orderModel);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentPage()),
    );
    log('...........place order............');
  } else {
    throw Exception('Failed to place order');
  }
}
