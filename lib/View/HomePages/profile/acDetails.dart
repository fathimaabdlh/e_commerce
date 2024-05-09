// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps, await_only_futures

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/View/HomePages/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController nametextController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Edit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              radius: 55.sp,
              backgroundImage: AssetImage(
                'assets/blank-profile-picture-973460_960_720.webp',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 8.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: nametextController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.person),
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 8.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: phoneController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.phone),
                    hintText: "Enter phone number",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                update(nametextController.text, phoneController.text, context);
              },
              child: Container(
                height: 7.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(child: Text('Update')),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> update(String name, String phoneno, BuildContext context) async {
    try {
      print("tyu");
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = await preferences.getString('token');
      var response = await post(
        Uri.parse("http://${ip}:3000/flutter/edituser"),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name,
          'phoneno': phoneno,
        },
      );

      // log(response.toString());
      print("Waiting...");

      if (response.statusCode == 200) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return ProfilePage();
        }));

        // var result = jsonDecode(response.body);
        // String? token = result['token'];
        // print(response.body);
        // print(response.statusCode);
        // print(token);
        //  homeData();
        //  print(homeData().toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
