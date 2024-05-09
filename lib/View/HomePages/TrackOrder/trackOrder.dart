// ignore_for_file: file_names, unused_import, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/CommonWidget/timeLine.dart';
import 'package:main_project_/Service/OrderHistoryService/historyInvoice.dart';
import 'package:main_project_/Service/OrderHistoryService/orderHisProvider.dart';
import 'package:main_project_/View/HomePages/OrderPages/orderPage.dart';




import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class TrackOrder extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String name;
  final String address;
  final String shipped;
  final dynamic orderID;

  const TrackOrder({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.name,
    required this.address,
    required this.shipped,
    required this.orderID, required int orderIndex,
  }) : super(key: key);

  @override
  State<TrackOrder> createState() => _OrdersHistoryPageState();
}

class _OrdersHistoryPageState extends State<TrackOrder> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrdersHistoryProvider>().getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.red,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyOrder();
              }));
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Center(
            widthFactor: 1.8.sp,
            child: Text(
              "Track Order",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                SizedBox(
                  width: 100.w,
                  height: 26.h,
                  // color: ColorData.grey,
                ),
                Positioned(
                  top: 3.h,
                  left: 3.w,
                  child: Container(
                    width: 36.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.sp, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://$ip:3000/products-images/${widget.productImage}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 7.h,
                    left: 44.w,
                    child: Text(
                      widget.productName,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14.sp),
                    )),
                Positioned(
                    top: 14.h,
                    left: 44.w,
                    child: Text(
                      'Price : ${widget.productPrice}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 10.sp),
                    )),
              ]),
              SizedBox(
                width: 10.w,
              ),

              Divider(
                endIndent: 14.sp,
                indent: 14.sp,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.h, left: 3.w),
                child: Text(
                  "Order Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              // Timeline for each order
              Container(
                // height: 10.h,
                // color: ColorData.grey,
                margin: EdgeInsets.only(left: 4.w),
                child: Column(
                  children: [
                    MyTimeLine(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      eventCart: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    MyTimeLine(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      eventCart: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                            child: Text(
                              'Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10.sp),
                            ),
                          ),
                          Text(
                            widget.address,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12.sp),
                          ),
                        ],
                      ),
                      // eventCart:
                      //     Text(order.items![index].product!.name.toString()),
                    ),
                    MyTimeLine(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      eventCart: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                            child: Text(
                              'Shipped',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 10.sp),
                            ),
                          ),
                          Text(
                            widget.shipped,
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 11.sp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Consumer<InvoiceApi>(
                builder: (BuildContext context, invoice, Widget? child) {
                  return InkWell(
                    onTap: () {
                      invoice!.addOrderID(widget.orderID);
                      // invoice.initializeNotifications();
                    },
                    child: SizedBox(
                      height: 5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            "Invoice download",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}