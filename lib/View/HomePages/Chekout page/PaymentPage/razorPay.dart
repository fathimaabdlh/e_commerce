// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:sizer/sizer.dart';

// class RazorPay extends StatefulWidget {
//   const RazorPay({super.key});

//   @override
//   State<RazorPay> createState() => _RazorPayState();
// }

// class _RazorPayState extends State<RazorPay> {
//   late Razorpay _razorpay;
//   TextEditingController amtController = new TextEditingController();

//   void openCheckout(amount) async {
//     amount = amount * 100;
//     var options = {
//       'key': 'rzp_test_1DP5mmOlF5G5ag',
//       'amount': 100,
//       'name': 'Acme Corp.',
//       'description': 'Fine T-Shirt',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint('Error : e');
//     }
//   }

//   void handlePaymentSuccess(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(
//         msg: 'Payment Successful' + response.paymentId!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void handlePaymentError(PaymentFailureResponse response) {
//     Fluttertoast.showToast(
//         msg: 'Payment Failed' + response.message!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   void handleExternalWallet(ExternalWalletResponse response) {
//     Fluttertoast.showToast(
//         msg: 'External Wallet' + response.walletName!,
//         toastLength: Toast.LENGTH_SHORT);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,

//             ),
//            Image.asset('Assets/Images/kid2-removebg-preview.png'),
//            SizedBox(height: 10.h,),
//            Text('Welcome to RazorPay',style: TextStyle(
//              fontSize: 30.sp,
//              fontWeight: FontWeight.bold,
//            ),),
//            TextFormField(
//             controller: amtController,
//             validator: (value) {
//               if (value==null ||  value!.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//             autofocus: false,
//             decoration: InputDecoration(
//               labelText: 'Enter Amount',
//               labelStyle: TextStyle(
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               ),
//             ),
//            ),
//            SizedBox(  height: 10.h,),
//            ElevatedButton(
//             onPressed: () {
//               if(amtController.text.toString().isNotEmpty){

//               }
//             },
//             child: Text('data'),
//             )

//           ],
//         ),
//       ),
//     );
//   }
// }
