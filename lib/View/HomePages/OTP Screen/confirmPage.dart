import 'package:flutter/material.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/PasswordsetupPage/ForgtPass.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 260,
              right: 75,
              // bottom: 90,
              child: Image.asset('Assets/Images/images16.jpg')),
          Positioned(
              bottom: 290,
              child: Text(
                '   The Account has been \n  confirmed successfully',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              )),
          Positioned(
              bottom: 250,
              child: Text(
                '           Welcome to our Family',
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 25),
              )),
          Positioned(
            bottom: 80,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 187, 208),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                        //  fontWeight: FontWeight.bold,
                  
                        fontSize: 30),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
