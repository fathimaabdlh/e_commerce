import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SwiperPage extends StatelessWidget {
  SwiperPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> slider = [
      ('Assets/Images/images3.jpg'),
      ('Assets/Images/images14.webp'),
      ('Assets/Images/images6.webp'),
      ('Assets/Images/images5.jpg'),
    ];
    return Swiper(
      itemBuilder: (context, index) {
        final image = slider[index];
        return Container(
          height: 20.h,
          width: 20.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        );
      },
      indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      itemCount: slider.length,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
    );
  }
}
