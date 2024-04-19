import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RowContainer extends StatelessWidget {
  RowContainer({Key? key, required this.cakeName, required this.isSelected})
      : super(key: key);
  final String cakeName;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("Assets/Images/mac.jpg"),
                    radius: 19.sp,
                    backgroundColor: Colors.amber[50],
                  ),
                  Text(
                    cakeName,
                    style: TextStyle(
                        color: isSelected ? (Colors.pink) : Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),

        // CircleAvatar(
        //   radius: 50,
        //   backgroundColor: Colors.amber[50],
        //   child: Image.asset('Assets/Images/mac.jpg'),
        // ),
        // CircleAvatar(
        //   radius: 50,
        //   backgroundColor: Colors.amber[50],
        //   child: Image.asset('Assets/Images/mac.jpg'),
        // ),
        // CircleAvatar(
        //   radius: 50,
        //   backgroundColor: Colors.amber[50],
        //   child: Image.asset('Assets/Images/mac.jpg'),
        // )
      ],
    );
  }
}
