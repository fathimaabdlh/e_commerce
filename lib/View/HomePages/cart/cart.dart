// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/cart/addCart/deletaData.dart';
import 'package:main_project_/Model/cart/cartData.dart';
import 'package:main_project_/Model/cart/qty/qtyAddService.dart';
import 'package:main_project_/Model/cart/qty/qtyDltService.dart';
import 'package:main_project_/Model/checkout/checkout/checkout.dart';
import 'package:main_project_/View/HomePages/Chekout%20page/checkOut.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CartData>().getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<CartDataProvider>().getAllPosts();
    return Scaffold(
      // bottomNavigationBar: ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(9.sp),
      //     topRight: Radius.circular(9.sp),
      //   ),
      //   child: NavigationBar(
      //     // indicatorColor: ColorData.grey,
      //     backgroundColor: Colors.white,
      //     height: 8.h,
      //     destinations: [
      //       IconButton(
      //         onPressed: () {
      //           // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           //   return HomePage();
      //           // }));
      //         },
      //         icon: Icon(
      //           Icons.home_rounded,
      //           size: 24.sp,
      //           color: Colors.red,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           // ignore: avoid_print
      //           print("favorite page");
      //         },
      //         icon: Icon(
      //           Icons.favorite_border_rounded,
      //           color: Colors.red,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return CartPage();
      //           }));
      //         },
      //         icon: Icon(
      //           Icons.add_shopping_cart_sharp,
      //           color: Colors.red,
      //         ),
      //       ),
      //       IconButton(
      //         onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) {
      //             return ProfilePage();
      //           }));
      //         },
      //         icon: Icon(
      //           Icons.account_circle,
      //           size: 26.sp,
      //           color: Colors.red,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 211, 223),
        leading: IconButton(
          onPressed: () {
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) {
            //   return HomePage();
            // }));
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Center(
          widthFactor: 2.6.sp,
          child: Text(
            "My Cart",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Consumer<CartData>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(child: CircularProgressIndicator());
          }
          var item = value.cartModel.data;

          if (item == null || item.items?.isEmpty == true) {
            return Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(
                    fontSize: 13.sp, color: Color.fromARGB(255, 206, 202, 202)),
              ),
            );
          }

          return Column(children: [
            SizedBox(
              height: 74.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: item.items!.length,
                itemBuilder: (context, index) {
                  var product = item.items![index].product!;
                  return SingleChildScrollView(
                      child: Column(children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 1.h),
                          width: double.infinity,
                          height: 22.h,
                        ),
                        Positioned(
                          top: 2.h,
                          left: 9.5.w,
                          child: Container(
                            width: 31.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://$ip:3000/products-images/${product.image!}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 6.h,
                          left: 45.w,
                          child: Row(
                            children: [
                              Text(
                                product.name.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 15.h,
                          left: 45.w,
                          child: Row(
                            children: [
                              Text(
                                '\$ ${product.price}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            top: 4.4.h,
                            child: Consumer<DeleteCartData>(
                              builder: (BuildContext context,
                                  DeleteCartData value, Widget? child) {
                                return InkWell(
                                  onTap: () {
                                    value.delete(product.sId);
                                    Provider.of<CartData>(context,
                                            listen: false)
                                        .getAllPosts();
                                  },
                                  child: Container(
                                    width: 4.4.h,
                                    height: 15.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                      size: 21.sp,
                                    ),
                                  ),
                                );
                              },
                            )),
                        Positioned(
                          top: 10.2.h,
                          right: 7.w,
                          child: Row(
                            children: [
                              Consumer<DeleteDataService>(
                                builder: (BuildContext context,
                                    DeleteDataService value, Widget? child) {
                                  return InkWell(
                                    onTap: () {
                                      value.deleteData(product.sId);
                                      Provider.of<CartData>(context,
                                              listen: false)
                                          .getAllPosts();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                      ),
                                      width: 6.w,
                                      height: 3.h,
                                      child: Icon(Icons.remove,
                                          size: 14.sp, color: Colors.black),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w, right: 2.w),
                                child: Text(
                                  item.items![index].quantity.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                              Consumer<AddDataService>(
                                builder: (BuildContext context,
                                    AddDataService value, Widget? child) {
                                  return InkWell(
                                    onTap: () {
                                      value.addData(product.sId);
                                      Provider.of<CartData>(context,
                                              listen: false)
                                          .getAllPosts();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(4.sp),
                                      ),
                                      width: 6.w,
                                      height: 3.h,
                                      child: Icon(Icons.add,
                                          size: 14.sp, color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        // total amount + pay now

                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: Divider(
                            endIndent: 5.w,
                            indent: 5.w,
                            color: Color.fromARGB(255, 196, 187, 187),
                          ),
                        ),
                      ],
                    )
                  ]));
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green,
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Charge: 40',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Total price ${value.cartModel.total}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),

                  // pay now
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShippingAddress()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green.shade200),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: const [
                          Text(
                            'Pay Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
