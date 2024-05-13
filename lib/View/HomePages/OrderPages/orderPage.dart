// ignore_for_file: use_key_in_widget_constructors, file_names
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Service/OrderHistoryService/orderHisProvider.dart';
import 'package:main_project_/View/HomePages/TrackOrder/trackOrder.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UserOrder extends StatefulWidget {
  const UserOrder({Key? key});

  @override
  State<UserOrder> createState() => _UserOrderState();
}

class _UserOrderState extends State<UserOrder> {
  @override
  void initState() {
    Provider.of<OrdersHistoryProvider>(context, listen: false).getAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OrdersHistoryProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isloading) {
            return Center(
              child: SpinKitWave(
                color: Color.fromARGB(255, 71, 161, 235),
                size: 40.0.sp,
              ),
            );
          }

          final orders = value.orderHistory.order ?? [];

          if (orders.isEmpty) {
            return Center(
              child: Text("No Order history available"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  var product = orders[index].items![0].product;
                  return InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackOrder(
                            orderIndex: index,
                            // Pass the orderIndex here
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 18.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 230, 231),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 20,
                            child: Container(
                              height: 15.h,
                              width: 28.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'http://$ip:3000/products-images/${product!.image}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            left: 150,
                            child: Text(
                              product.name.toString(),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 150,
                            child: Text(
                              product.price.toString(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Track Order',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
