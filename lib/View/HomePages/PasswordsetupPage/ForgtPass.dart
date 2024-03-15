import 'package:flutter/material.dart';
import 'package:main_project_/View/HomePages/PasswordsetupPage/acRecover.dart';
import 'package:sizer/sizer.dart';

class PasswordPage extends StatelessWidget {
   PasswordPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Forget your\n Password?',
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Dont Worry! Please enter Your mail',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(
            height: 30,
          ),
            // MyTextField(
            //   controller: newPasswordController,
            //   hintText: 'Enter your mail',
            //   obscureText: true),

          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     fillColor: Color.fromARGB(255, 228, 226, 226),
          //     filled: true,
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10))),
          //     labelText: 'Enter Your Email',
          //   ),
          // ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecoveryPage(),
                  ));
            },
            child: Container(
              height: 10.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 187, 208),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  'Send Verification Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
