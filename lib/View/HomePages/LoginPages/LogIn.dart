import 'dart:convert';
// import 'dart:js';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/View/HomePages/PasswordsetupPage/ForgtPass.dart';
// import 'package:main_project_/Service/provider_service.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/myButton.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/signUp.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/squareTile.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/textField.dart';
import 'package:main_project_/View/HomePages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Future<void> login(String email, String password) async {
    final TextEditingController emailController =TextEditingController();
        final TextEditingController passwordController =TextEditingController();

   Future<void> login(String email, String password) async {
  try {
    var response = await post(
      Uri.parse("http://${ip}:3000/flutter/fuser_signin"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        'email': email,
        
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      String? token = result['token'];

      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        
        // Navigate to homepage if token exists
        Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        // Display error message if token is not received
        print('Token not received.');
      }
    } else {
      // Display error message for non-200 status code
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print(e.toString());
  }
} 
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context as BuildContext,
                            MaterialPageRoute(builder: (context) => PasswordPage()),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap:(){
                    login(emailController.text.toString(),
                    passwordController.text.toString());
                  //  signUserIn(context);

// ProviderService().signIn(email, password));
                  } 
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'Assets/Images/apple.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'Assets/Images/google.jpg')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

   signUserIn(context ) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    
  }
}