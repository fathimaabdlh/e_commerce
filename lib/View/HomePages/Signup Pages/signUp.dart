// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Service/homeData.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/OTP%20Screen/otpVerification.dart';
import 'package:main_project_/View/HomePages/OTP%20Screen/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();

  Future<void> signup(
    BuildContext context,
    String email,
    String password,
    String phoneno,
    String name,
  ) async {
    try {
      var response = await http.post(
        Uri.parse("http://${ip}:3000/flutter/fuser_registration"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phoneno': phoneno,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        String? userid = result['userid'];
        log('njjj${userid}');
        if (userid != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userid', userid);
          log('${prefs}');
          DataProvider();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Otp(otpg: userid)),
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Try Again'),
              );
            },
          );
          print('userid not received.');
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed with status code: ${response.statusCode}'),
            );
          },
        );
        print('Request failed with status: ${response.body}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 200,
                  child: Image.asset('Assets/Images/lock.jpeg'),
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your name",
                      ),
                      validator: (input) => input!.trim().isEmpty
                          ? 'Please enter a valid name'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Email",
                      ),
                      validator: (input) => !input!.contains('@gmail.com')
                          ? 'Please enter a valid email'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phonenoController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Phone number",
                      ),
                      validator: (input) => input!.trim().isEmpty
                          ? 'Please enter a valid phoneNumber'
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: passwordController,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your Password",
                      ),
                      validator: (input) => input!.length < 6
                          ? 'Must be at least 6 characters'
                          : null,
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (contex) => Otp()));
                  },
                  child: Text(
                    "forgot password?",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      signup(
                        context,
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        phonenoController.text.toString(),
                        nameController.text.toString(),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Back to Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:main_project_/CommonWidget/colors.dart';
// import 'package:main_project_/CommonWidget/mainbutton.dart';
// import 'package:main_project_/View/HomePages/OTP%20Screen/register.dart';
// import 'package:main_project_/View/HomePages/Signup%20Pages/space.dart';
// import 'package:main_project_/View/HomePages/Signup%20Pages/textStyle.dart';
// import 'package:main_project_/CommonWidget/textfild.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController userName = TextEditingController();
//   final TextEditingController userPass = TextEditingController();
//   final TextEditingController userEmail = TextEditingController();
//   final TextEditingController userPh = TextEditingController();

//   Future<void> signup(
//     BuildContext context,
//     String userEmail,
//     String userPass,
//     String userPh,
//     String userName,
//   ) async {
//     try {
//       var response = await http.post(
//         Uri.parse("http://192.168.29.154:3000/flutter/fuser_registration"),
//         headers: {"Content-Type": "application/x-www-form-urlencoded"},
//         body: {
//           'name': userName,
//           'email': userEmail,
//           'password': userPass, // Removed extra space after 'Password'
//           'phoneno': userPh,
//         },
//       );
//       print(response.body);
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         String? userid = result['userid'];
//         if (userid != null) {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           await prefs.setString('userid', userid);

//           // Navigate to homepage if userid exists
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Register()),
//           );
//         } else {
//           // Display error message if userid is not received
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text('Try Again'),
//                 // Add any other necessary content to your dialog
//               );
//             },
//           );
//           print('userid not received.');
//         }
//       } else {
//         // Display error message for non-200 status code
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('Failed with status code: ${response.statusCode}'),
//               // Add any other necessary content to your dialog
//             );
//           },
//         );
//         print('Request failed with status: ${response.body}.');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: blackBG,
//       body: Padding(
//         padding: EdgeInsets.only(top: 50.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SpaceVH(height: 50.0),
//               Text(
//                 'Create new account',
//                 style: headline1,
//               ),
//               SpaceVH(height: 10.0),
//               Text(
//                 'Please fill in the form to continue',
//                 style: headline3,
//               ),
//               SpaceVH(height: 60.0),
//               textFild(
//                 validator: (value) {
//                   return value!.toString().isEmpty ? 'please enter ' : null;
//                 },
//                 controller: userName,
//                 image: 'user.svg',
//                 keyBordType: TextInputType.name,
//                 hintTxt: 'Full Name',
//               ),
//               textFild(
//                 validator: null,
//                 controller: userEmail,
//                 keyBordType: TextInputType.emailAddress,
//                 image: 'user.svg',
//                 hintTxt: 'Email Address',
//               ),
//               textFild(
//                 validator: null,
//                 controller: userPh,
//                 image: 'user.svg',
//                 keyBordType: TextInputType.phone,
//                 hintTxt: 'Phone Number',
//               ),
//               textFild(
//                 validator: null,
//                 controller: userPass,
//                 isObs: true,
//                 image: 'hide.svg',
//                 hintTxt: 'Password',
//               ),
//               SpaceVH(height: 80.0),
//               Mainbutton(
//                 onTap: () {
//                   signup(
//                     context,
//                     userEmail.text.toString(),
//                     userPass.text.toString(),
//                     userPh.text.toString(),
//                     userName.text.toString(),
//                   );
//                 },
//                 text: 'Sign Up',
//                 btnColor: Color.fromARGB(255, 247, 187, 208),
//               ),
//               SpaceVH(height: 20.0),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: RichText(
//                   text: TextSpan(children: [
//                     TextSpan(
//                       text: 'Have an account? ',
//                       style: headline.copyWith(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' Sign In',
//                       style: headlineDot.copyWith(
//                         fontSize: 14.0,
//                       ),
//                     ),
//                   ]),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
