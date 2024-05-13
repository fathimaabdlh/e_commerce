// ignore_for_file: unused_import, file_names
import 'package:flutter/material.dart';
import 'package:main_project_/categories/HomeElectronicsProduct.dart';
import 'package:main_project_/categories/homeFasionProduct.dart';
import 'package:sizer/sizer.dart';

class HomeFasion extends StatelessWidget {
  const HomeFasion({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomeFasionProduct();
        }));
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 2.h, right: 4.w),
              child: CircleAvatar(
                backgroundImage: AssetImage("Assets/Images/fas.png"),
                backgroundColor: Colors.grey,
                radius: 25.sp,
                // child: CircleAvatar(
                //   backgroundColor: ColorData.grey,
                //   radius: 16.sp,
                //   backgroundImage: AssetImage("assets/images/headSet.PNG"),
                // ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, top: 1.h, right: 4.w),
              child: Text(
                "Fashion",
                style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ]
        ),
      )
    );
  }
}