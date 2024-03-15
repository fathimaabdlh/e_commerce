import 'package:flutter/material.dart';


import 'package:main_project_/View/HomePages/SplashScreen/splashScreen.dart';
import 'package:main_project_/View/HomePages/home.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget i`s the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
           theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
           ),
          home: 
            //  Home(),
          SplashScreen(),
         
          
 
        );
      }
    );
  }
}

