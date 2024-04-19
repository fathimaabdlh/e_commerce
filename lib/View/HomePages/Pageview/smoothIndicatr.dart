import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/Service/BannerService/bannerMod.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SwiperPage extends StatefulWidget {
  SwiperPage({Key? key}) : super(key: key);

  @override
  State<SwiperPage> createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
@override
void initState() {
  super.initState();
  Provider.of<BannerGetData>(context, listen: false).fetchBannerData();
}

  @override
  Widget build(BuildContext context) {
   return Consumer<BannerGetData>(
  builder: (BuildContext context, BannerGetData value, Widget? child) {
    print('isLoading: ${value.isLoading}');
    print('bannerData: ${value.bannerData}');
    
    if (value.isLoading || value.bannerData == null) {
      // If data is loading or not yet fetched, show loading indicator
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Swiper(
        loop: true,
        itemBuilder: (context, index) {
          // Assuming BannerModel has a field called 'image' which contains the image URL
          return Container(
            height: 22.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  'http://$ip:3000/products-images/${ value.bannerData!.banner![index].image!}'
                 
                  ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: true,
        itemCount: value.bannerData!.banner!.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      );
    }
  },
);
  }}