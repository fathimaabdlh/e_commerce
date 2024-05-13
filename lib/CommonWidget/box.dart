import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class myBox extends StatelessWidget{
  final Widget? child;
  final Color? color;
  const myBox(
    {
      super.key,
      required this.child,
      required this.color,
    } 
  );
  
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 10.w,
     height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
           color: color,

        border: Border.all(
          width: 1,
        ),
      ),
      child: child,
       );
  }
}