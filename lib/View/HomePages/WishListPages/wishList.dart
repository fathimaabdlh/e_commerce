// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Model/Wishlist/Wishlist%20Add/addService.dart';
import 'package:main_project_/Model/Wishlist/wish_list/wish_list.dart';
import 'package:main_project_/Model/a_sdfgh/fasion.dart';
import 'package:main_project_/Service/WishlistService/wishlistProvider.dart';
import 'package:main_project_/wishlistProvider/viewWishlistProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    Provider.of<ViewWishListProvider>(context, listen: false).getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wishlist'),
        ),
        body: Consumer<ViewWishListProvider>(
            builder: (BuildContext context, fathima, Widget? child) {
          // ignore: unnecessary_null_comparison
          if (fathima.isloading || fathima.service == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var product = fathima.wishList.wishlist;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 2,
              ),
              itemCount: product!.length,
              itemBuilder: (context, index) {
                // FavoriteItemm item = favoriteItems[index];
                var add = product[index].product;

                return Container(
                  height: 15.h,
                  width: 8.w,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://$ip:3000/products-images/${add!.image}'),
                                fit: BoxFit.cover)),
                        // child: Image.network(
                        //   'assets/1600w-1h_Fj-14AQs.webp',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      Positioned(
                          right: 3,
                          child: Consumer<WishAddDataService>(
                            builder: (BuildContext context,
                                WishAddDataService value, Widget? child) {
                              return IconButton(
                                  onPressed: () {
                                    value.addData(add.id);
                                  },
                                  icon: Icon(Icons.favorite));
                            },
                          ))
                    ],
                  ),
                );
              },
            );
          }
        }));
  }
}
