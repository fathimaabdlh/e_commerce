// // ignore_for_file: camel_case_types, unnecessary_brace_in_string_interps, await_only_futures, non_constant_identifier_names

// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;

// import 'package:main_project_/CommonWidget/ip.dart';
// import 'package:main_project_/Model/homeModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class HomeGetData {
//   Future<CategorizedProducts> HomeGetDat() async {
//     try {
//       log('aaaaaaaaaaaaaaaa');
//       SharedPreferences pref = await SharedPreferences.getInstance();
//       final token = await pref.getString('token');
//       log('${token}');
//       final response = await http.get(
//         Uri.parse('http://${ip}:3000/flutter/fhome'),
//         headers: <String, String>{
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//       );
//       log('hhhhhhhhhhhhh${response.body}');
//       // log('aaaaaaaaaaaaa');

//       log('${response.headers}');
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         return CategorizedProducts.fromJson(jsonData['CategorizedProducts']);
//         // return CategorizedProducts.fromJson(json.decode(response.body));
//       } else {
//         throw Exception();
//       }
//     } catch (e) {
//       // log('Error$e');

//       throw Exception("");
//     }
//   }
// }

// final CategorizedProducts datas=await HomeGetData().HomeGetDat();

// provider(srarr,gghh){
// retun text(gghh.datas.yhuhu)

// }
// class NavBarProvider with ChangeNotifier{
// SelectedIndex _selectedIndex = SelectedIndex(0);

// void  ChangeSelectedIndex(int index){
//    SelectedIndex _selectedIndex = SelectedIndex(index);
//    notifyListeners();
// }
//  SelectedIndex get selectedIndex => _selectedIndex;
// }
// class SelectedIndex {
//   final int Index;

//   const SelectedIndex(this.Index);
// }

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:provider_rest_api/models/data_model.dart';

// class Services{
//   Future<DataModel> getData(context) async {
//     late DataModel data;
//     try {
//       final response = await http.get(
//         Uri.parse('https://jsonplaceholder.typicode.com/comments/1'),
//       );
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         data = DataModel.fromJson(item);// Mapping json response to our data model
//       } else {
//         print('Error Occurred');
//       }
//     } catch (e) {
//       print('Error Occurred'+e.toString());
//     }
//     return data;
//   }
// }
