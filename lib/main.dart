// ignore_for_file: must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:main_project_/Model/CartModel/cardId.dart';
import 'package:main_project_/Model/cart/addCart/addDataCart.dart';
import 'package:main_project_/Model/cart/addCart/deletaData.dart';
import 'package:main_project_/Model/cart/cartData.dart';
import 'package:main_project_/Model/cart/qty/qtyAddService.dart';
import 'package:main_project_/Model/cart/qty/qtyDltService.dart';
import 'package:main_project_/Model/profileModel/prof_get/prof_get.dart';
import 'package:main_project_/Service/BannerService/bannerMod.dart';
import 'package:main_project_/Service/ProfileServiceProvider/profData.dart';
import 'package:main_project_/Service/homeData.dart';
import 'package:main_project_/Service/provider_service.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/cart/cartList.dart';
import 'package:main_project_/View/HomePages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

void main() async {
  // await Hive.initFlutter();
  // await Hive.openBox('myBox');
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool userlogin = prefs.getBool('userlogin') ?? false;
  runApp(MyApp(
    userlogin: userlogin,
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.userlogin});
  bool userlogin;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget i`s the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => BannerGetData()),
        ChangeNotifierProvider(create: (_) => CartData()),
        ChangeNotifierProvider(create: (_) => AddCartData()),
        // create: (context) => CartItemPassProvider(),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => DeleteCartData()),
        ChangeNotifierProvider(create: (_) => AddDataService()),
        ChangeNotifierProvider(create: (_) => DeleteDataService()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          home: widget.userlogin ? Home() : LoginPage(),

          //  Home(),
        );
      }),
    );
  }
}
