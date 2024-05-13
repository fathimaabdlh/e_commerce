// import 'package:card_swiper/card_swiper.dart';
// ignore_for_file: unused_import, must_be_immutable, unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/box.dart';
import 'package:main_project_/CommonWidget/foodContainer.dart';
import 'package:main_project_/CommonWidget/foodContainer3.dart';
import 'package:main_project_/CommonWidget/foodContainer4.dart';
import 'package:main_project_/CommonWidget/foodContainer5.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/Wishlist/wish_list/wish_list.dart';
import 'package:main_project_/Service/OrderService/orderService.dart';
import 'package:main_project_/Service/Theme/themeProvider.dart';
import 'package:main_project_/Service/provider_service.dart';
import 'package:main_project_/View/HomePages/Catagories/catagoryPage.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/OrderPages/orderPage.dart';
import 'package:main_project_/View/HomePages/Pageview/smoothIndicatr.dart';
import 'package:main_project_/View/HomePages/ViewPages/ViewPage.dart';
import 'package:main_project_/View/HomePages/WishListPages/wishList.dart';
import 'package:main_project_/View/HomePages/cart/cart.dart';
import 'package:main_project_/View/HomePages/profile/profile.dart';
import 'package:main_project_/categories/homeElectronics.dart';
import 'package:main_project_/categories/homeFancy.dart';
import 'package:main_project_/categories/homeFasion.dart';
import 'package:main_project_/categories/homeJwellery.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../Service/homeData.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Function> screenBuilders = [
    () => categoryPage(),
    () => CartPage(),
    () => ProfilePage(),
    () => Home()
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<DataProvider>(context, listen: false).fetchData();
    // Provider.of<OrderCreationProvider>(context, listen: false);
  }

  final TextEditingController _searchController =
      TextEditingController(text: '');

  // ignore_for_file: unnecessary_brace_in_string_interps, await_only_futures, unnecessary_string_interpolations
  @override
  Widget build(BuildContext context) {
    // List screens = [categoryPage(), cartPage(), profilePage(), Home()];
    // final navBarProvider = Provider.of<NavBarProvider>(context);
    int pageIndex = 0;
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade100,
      bottomNavigationBar: Consumer<NavBarProvider>(
        builder: (context, navBarProvider, _) => CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: Color.fromARGB(255, 218, 149, 173),
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            navBarProvider.changeSelectedIndex(index);
          },
          items: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserOrder()));
              },
              icon: Icon(
                Icons.category_sharp,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(
                Icons.shopping_cart_checkout,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ProfilePage()));
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FavoritePage()));
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          color: Colors.red,
        ),
        title: Center(
          child: Text(
            'Cairo_Almaady',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add_outlined,
                color: Colors.pink,
              ))
        ],
      ),
      body:
          // screens[
          //   navBarProvider.selectedIndex.Index
          // ],
          // child:
          SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 3.h,
            ),
            Container(height: 22.h, width: 80.w, child: SwiperPage()),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 4.h,
                  width: 87.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.pink),
                  ),
                  child: CupertinoSearchTextField(
                    controller: _searchController,
                  ),
                ),
                myBox(
                  color: Theme.of(context).colorScheme.primary,
                  child: IconButton(
                      onPressed: () {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggleThemr();
                        print("shareButton");
                      },
                      icon: Icon(
                        Icons.tune,
                        color: Theme.of(context).colorScheme.secondary,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Text(
                  'Catagories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                HomeElectronics(),
                HomeFasion(),
                HomeFancy(),
                HomeJwellery()
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 6.w,
            //     top: 1.h,
            //   ),
            //   child: Row(
            //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       catagories('Assets/Images/cou-removebg-preview.png'),
            //       SizedBox(
            //         width: 5.w,
            //       ),
            //       catagories('Assets/Images/he-removebg-preview.png'),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewPage(),
                        ));
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.pink,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 32.h,
                child: Row(
                  children: [DressContainer()],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Electronics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 30.h,
                child: Row(
                  children: [FoodContainer3()],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Jwellery',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 30.h,
                child: Row(
                  children: [FoodContainer4()],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: 30.h,
                child: Row(
                  children: [FoodContainer5()],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget catagories(String images) {
    return Container(
      height: 8.h,
      width: 18.w,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: Colors.pink)
      ),
      child: Center(
          child: Image.asset(
        images,
        height: 14.h,
        width: 14.w,
      )),
    );
  }
}

class NavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
