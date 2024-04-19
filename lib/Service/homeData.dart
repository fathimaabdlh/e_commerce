// import 'dart:math';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/a_sdfgh/a_sdfgh.dart';
import 'package:main_project_/Model/homeModel.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// Define your model classes here
// (CategorizedProducts, Electronic, Fancy, Fasion, Jwellery, Root)

class DataProvider with ChangeNotifier {
  // Define any state variables you want to manage here
  ASdfgh? _homeData;
  bool _isLoading = false;

  ASdfgh? get homeData => _homeData;
  bool get isLoading => _isLoading;

  // Function to fetch data from API
  
  Future<void> fetchData() async {
    try {
       log('catagory ________________________');
      SharedPreferences pref = await SharedPreferences.getInstance();
      final token = await pref.getString('token');
      log('${token}');
      // Make the API call to fetch data
     
      final response = await http.get(
        Uri.parse('http://$ip:3000/flutter/fhome'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      log('Response Status Code: ${response.statusCode}');
// log('Response Body: ${response.body}');

      // Check if the response is successful
      if (response.statusCode == 200) {
        log('sdfghjjjjjj');
        // Parse the response data into your model classes

        final jsonData = json.decode(response.body);
        if (jsonData != null && jsonData is Map<String, dynamic>) {
          log(jsonData.toString());

          log('catagory ________________________');

          _homeData = ASdfgh.fromJson(json.decode(response.body));

          notifyListeners();
        } else {
          throw Exception('Invalid response data format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// import 'dart:convert';
// import 'dart:developer';
// import 'package:fashion_world/ip.dart';
// import 'package:http/http.dart' as http;

// import 'package:fashion_world/commonWidget/buildUser/buildUser.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../model/categorizedmodel.dart';

// class DataProvider with ChangeNotifier {
//   CategorizedProducts? _categorizedProducts;
//   List<Electronic>? _electronics = [];
//   List<User>? _users = [];

//   CategorizedProducts? get categorizedProducts => _categorizedProducts;
//   List<Electronic>? get electronics => _electronics;
//   List<User>? get users => _users;

//   Future<void> fetchData() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       log('Token: $token');

//       final response = await http.get(
//         Uri.parse('http://$ip:3000/flutter/fhome'),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         _categorizedProducts =
//             CategorizedProducts.fromJson(jsonData['CategorizedProducts']);
//         _electronics = jsonData['electronics']
//             .map<Electronic>((item) => Electronic.fromJson(item))
//             .toList();
//         _users = jsonData['users']
//             .map<User>((item) => User.fromJson(item))
//             .toList();
//         notifyListeners();
//       } else {
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       throw Exception('Error fetching data: $e');
//     }
//   }
// // }

// // ignore_for_file: await_only_futures, unnecessary_brace_in_string_interps, unnecessary_string_interpolations

// import 'dart:developer';

// import 'package:http/http.dart' as http;
// import 'package:main_project_/CommonWidget/ip.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// Future  homeData() async {
//   try {
//     log('aaaaaaaaaaaaaaaa');
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     final token = await pref.getString('token');
//     log('${token}');
//     final response = await http.get(
//       Uri.parse('http://${ip}:3000/flutter/fhome'),
//       headers: <String, String>{
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//     );
//     log('hhhhhhhhhhhhh${response.body}');
//     // log('${response.body}dryytdtdyfuyf');
//     log('aaaaaaaaaaaaa');

//     log('${response.headers}');
//     if (response.statusCode == 200) {
//       log('successful');

//       // return CategorizedProducts.fromJson(json.decode(response.body));
//     } else {
//       throw Exception();
//     }
//   } catch (e) {
//     // log('Error$e');

//     throw Exception("");
//   }
// }
