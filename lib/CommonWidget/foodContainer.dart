import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/Wishlist/Wishlist%20Add/addService.dart';
import 'package:main_project_/Model/cart/addCart/addDataCart.dart';
import 'package:main_project_/Service/homeData.dart';
import 'package:main_project_/categories/fashionPage.dart';
import 'package:main_project_/wishlistProvider/viewWishlistProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DressContainer extends StatefulWidget {
  const DressContainer({Key? key});

  @override
  State<DressContainer> createState() => _DressContainerState();
}

class _DressContainerState extends State<DressContainer> {
  @override
  void initState() {
    Provider.of<WishAddDataService>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, provider, child) {
      if (provider.isLoading || provider.homeData == null) {
        log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
        // If data is loading or not yet fetched, show loading indicator
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        log("_______________________________________________________________");
        return SizedBox(
            // Data is available, proceed with building the UI
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: ListView.builder(
                itemCount:
                    provider.homeData?.categorizedProducts?.fasion?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final fasion =
                      provider.homeData?.categorizedProducts?.fasion![index];

                  return InkWell(
                     onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return FashionPage(
                            productName: fasion.name.toString(),
                            productImage: fasion.image.toString(),
                            productPrice: fasion.price.toString(),
                            productId: fasion.id.toString());
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250,
                              width: 180,
                              // color: const Color.fromARGB(255, 182, 133, 118),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 160.0,
                                    height: 160.0,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'http://$ip:3000/products-images/${fasion!.image!}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 6.w,
                                    // bottom: 10.h,
                                    child: Consumer<WishAddDataService>(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return IconButton(
                                          onPressed: () {
                                            value.addData(fasion.id);
                                            // Add your favorite button functionality here
                                            print("favorite button");
                                          },
                                          icon: Icon(
                                            Icons.favorite_border_rounded,
                                            color: Colors.red,
                                            size: 19.sp,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top: 16.8.h,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          border: Border.all(color: Colors.grey),
                                          // color: ColorData.greyColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(9),
                                              bottomRight: Radius.circular(9))),
                                      width: 38.w,
                                      height: 10.h,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 75,
                                    left: 8,
                                    child: Text(
                                      fasion.name ?? "",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 55,
                                    left: 8,
                                    child: Text(
                                      '\$ ${fasion.price}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 2, 2, 2)),
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Positioned(
                                    bottom: 35,
                                    left: 8,
                                    child: Text(
                                      fasion.description ?? "",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 8, 8, 8),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5.w,
                                    bottom: 0.1.h,
                                    child: Consumer<AddCartData>(
                                      builder: (BuildContext context, value,
                                          Widget? child) {
                                        return IconButton(
                                            onPressed: () {
                                              value.add(fasion.id);
                                              log("${value.add(fasion.id)}");
                    
                                              // ignore: avoid_print
                                              print("control button");
                                            },
                                            icon: Icon(
                                              Icons.control_point_rounded,
                                              size: 22.sp,
                                              color: Colors.pink,
                                            ));
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.h,
                                    // left: 18.4.w,
                                    child: IconButton(
                                        onPressed: () {
                                          // ignore: avoid_print
                                          print("star icon");
                                        },
                                        icon: Icon(
                                          Icons.star_outlined,
                                          color: Colors.red,
                                          size: 13.sp,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ]),
                    ),
                  );
                }));
      }
    });
  }
}
