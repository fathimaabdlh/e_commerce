import 'package:flutter/material.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';

// import 'package:main_project_/View/Log%20in%20pages/LogIn.dart';

import 'package:sizer/sizer.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              height: 950,
              width: MediaQuery.sizeOf(context).width,
              // color: Colors.red,
              child: Image.asset(
                'Assets/Images/images8.webp',
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 550,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )),
          ),
        ),
        Positioned(
          bottom: 420,
          child: Text(
            '       A Delicious Journey\n   to the World of Desserts',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
        const Positioned(
          bottom: 330,
          child: Text(
            '   Life is short, eat the dessert first....',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 23),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 70,
          child: Container(
            height: 60,
            width: 260,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 247, 187, 208),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ),
        )
        // SizedBox(height: 30,),
      ]),
    );
  }
}
