import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

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
                'Assets/Images/images2.jpg',
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
        Positioned(
          bottom: 330,
          child: Text(
            '          Life occurs somewhere between\n   our aspirations and our just desserts...',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 23),
          ),
        )
        // SizedBox(height: 30,),
      ]),
    );
  }
}
