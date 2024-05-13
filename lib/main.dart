// ignore_for_file: must_be_immutable, unused_import
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/theme.dart';
import 'package:main_project_/Model/CartModel/cardId.dart';
import 'package:main_project_/Model/Wishlist/Wishlist%20Add/addService.dart';
import 'package:main_project_/Model/cart/addCart/addDataCart.dart';
import 'package:main_project_/Model/cart/addCart/deletaData.dart';
import 'package:main_project_/Model/cart/cartData.dart';
import 'package:main_project_/Model/cart/qty/qtyAddService.dart';
import 'package:main_project_/Model/cart/qty/qtyDltService.dart';
import 'package:main_project_/Model/checkout/checkout/checkOutModel.dart';
import 'package:main_project_/Model/profileModel/prof_get/prof_get.dart';
import 'package:main_project_/Service/BannerService/bannerMod.dart';
import 'package:main_project_/Service/OrderHistoryService/orderHisProvider.dart';
import 'package:main_project_/Service/PlaceOrder/orderProvider.dart';
import 'package:main_project_/Service/ProfileServiceProvider/profData.dart';
import 'package:main_project_/Service/Theme/themeProvider.dart';
import 'package:main_project_/Service/homeData.dart';
import 'package:main_project_/Service/provider_service.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/cart/cartList.dart';
import 'package:main_project_/View/HomePages/home.dart';
import 'package:main_project_/wishlistProvider/viewWishlistProvider.dart';
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
        ChangeNotifierProvider(create: (_) => ViewWishListProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => BannerGetData()),
        ChangeNotifierProvider(create: (_) => CartData()),
        ChangeNotifierProvider(create: (_) => AddCartData()),
        ChangeNotifierProvider(create: (_) => NavBarProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => DeleteCartData()),
        ChangeNotifierProvider(create: (_) => AddDataService()),
        ChangeNotifierProvider(create: (_) => DeleteDataService()),
        ChangeNotifierProvider(create: (_) => WishAddDataService()),
        ChangeNotifierProvider(create: (_) => CheckoutApi()),
        ChangeNotifierProvider(create: (_) => OrderCreationProvider()),
        ChangeNotifierProvider(create: (_) => OrdersHistoryProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return Consumer<ThemeProvider>(
          builder: (BuildContext context, theme, Widget? child) {
            return MaterialApp(
              theme: theme.themeData,
              // Provider.of<ThemeProvider>(context).themeData,

              home: widget.userlogin ? Home() : LoginPage(),

              //  Home(),
            );
          },
        );
      }),
    );
  }
}
