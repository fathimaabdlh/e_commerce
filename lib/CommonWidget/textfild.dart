import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/colors.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/textStyle.dart';
// import 'package:main_project_/View/Log%20in%20pages/signup%20pages/textStyle.dart';
import 'package:sizer/sizer.dart';

Widget textFild({
  required String? Function(String?)? validator,
  required String hintTxt,
  required String image,
  required TextEditingController controller,
  bool isObs = false,
  TextInputType? keyBordType,
}) {
  return Container(
    height: 10.0.h,
    padding: EdgeInsets.symmetric(horizontal: 30.0),
    margin: EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    decoration: BoxDecoration(
      color: blackTextFild,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70.0.w,
          child: TextFormField(
            validator:
                // (value) {
                //   if(value ==null || value.isEmpty){
                //     'please enter password';
                //   }
                // }
                validator,
            textAlignVertical: TextAlignVertical.center,
            obscureText: isObs,
            keyboardType: keyBordType,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: hintStyle,
            ),
            style: headline2,
          ),
        ),
        // SvgPicture.asset(
        //   'assets/icon/$image',
        //   height: 20.0,
        //   color: grayText,
        // )
      ],
    ),
  );
}
