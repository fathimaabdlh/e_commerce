import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/foodContainer2.dart';
import 'package:main_project_/CommonWidget/rowCont.dart';
import 'package:sizer/sizer.dart';

class ViewPage extends StatelessWidget {
  ViewPage({Key? key});
  final TextEditingController _searchController =
      TextEditingController(text: 'What are you looking for?');
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
              height: 4.h,
              width: 87.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.pink),
              ),
              child: CupertinoSearchTextField(
                controller: _searchController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: FoodContainer2(),
            ),
            // Container(
            //   height: 50.h,
            //       width: double.infinity,
            //   child: GridView.count(
            //     scrollDirection: Axis.vertical,
            //     crossAxisCount: 2,
            //   children: [

            //   ],

            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
