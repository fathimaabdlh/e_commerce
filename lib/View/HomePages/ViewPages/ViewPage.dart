import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/foodContainer2.dart';
import 'package:main_project_/CommonWidget/rowCont.dart';
import 'package:sizer/sizer.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'our Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RowContainer(
                  cakeName: 'All',
                  isSelected: true,
                ),
                RowContainer(
                  cakeName: 'Macarons',
                  isSelected: false,
                ),
                RowContainer(
                  cakeName: 'Waffles',
                  isSelected: false,
                ),
                RowContainer(
                  cakeName: 'Cupcakes',
                  isSelected: false,
                ),
                RowContainer(
                  cakeName: 'Tarts',
                  isSelected: false,
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              height: 50.h,
                  width: double.infinity,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
              children: [
            //    Container(
            //   height: 40.h, // Set an appropriate height here
            //   child: FoodContainer2(),
            // ),
              ],
              
              
              
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
