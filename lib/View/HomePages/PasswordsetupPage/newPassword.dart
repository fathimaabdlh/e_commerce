import 'package:flutter/material.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/textField.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
   final TextEditingController newEmailController = TextEditingController();
   final TextEditingController newPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Text(
                '       Create New Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 9,
          ),
          Text(
            'Your new Password must be different from\n      the one you used previously',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: 39,
          ),
           MyTextField(
              controller: newEmailController,
              hintText: 'Enter your mail',
              obscureText: true),
              SizedBox(height: 30,),
               MyTextField(
              controller: newPasswordController,
              hintText: 'Confirm Password',
              obscureText: false),
              SizedBox(height: 100,),

              Container(
              height: 10.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 247, 187, 208),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

        

          //    TextField(
          // obscureText: true,
          // decoration: InputDecoration(
          //   fillColor: Color.fromARGB(255, 228, 226, 226),
          //   filled: true,
          //   border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(10))),
          //   labelText: 'Enter a New Password',
          //   ),
          // ),
        ],
      ),
    );
  }
}
