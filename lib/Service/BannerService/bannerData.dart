// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:main_project_/CommonWidget/ip.dart';
// import 'package:main_project_/Model/homeModel.dart';
// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class Banner with ChangeNotifier {
//   Banner? _bannerData;
//   bool _isLoading = false;

//   Banner? get bannerData => _bannerData;
//   bool get isLoading => _isLoading;

//   Future<void> fetchData() async {
//     try {
//       _isLoading = true; // Set loading to true before making the request
//       notifyListeners();

//       SharedPreferences pref = await SharedPreferences.getInstance();
//       final token = pref.getString('token');
//       log('Token: $token');

//       final response = await http.get(
//         Uri.parse('http://$ip:3000/flutter/banner'),
//         headers: <String, String>{
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );

//       log('Response Status Code: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         log('Response Body: $jsonData');

//         _bannerData = Banner.fromJson(jsonData);
//         notifyListeners();
//       } else {
//         log('Failed to load data: ${response.statusCode}');
//       }
//     } catch (e) {
//       log('Error fetching data: $e');
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

// }
