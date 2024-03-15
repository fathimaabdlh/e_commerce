import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/ip.dart';
import 'package:main_project_/View/HomePages/OTP%20Screen/confirmPage.dart';
import 'package:main_project_/View/HomePages/Signup%20Pages/signUp.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class Otp extends StatefulWidget {
  final otpg;
  const Otp({
    Key? key,
    this.otpg,
  }) : super(
          key: key,
        );

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController otpController = TextEditingController();
  // final TextEditingController id = TextEditingController();

  // Future<void> _validateOTP() async {
  //   if (_otp == '') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ConfirmPage(),
  //       ),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('Invalid OTP'),
  //           content: Text('Please enter a valid OTP.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }

  Future<void> otpVerify(
    BuildContext context,
    // String id,
    String otp,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userid = prefs.get('userid');
      var response = await http.post(
        Uri.parse("http://${ip}:3000/flutter/validate-otp"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          'id': userid,
          'otp': otp,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        log('${result}');
        // String? userId = result['userid'];
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ConfirmPage();
        }));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed with status code: ${response.statusCode}'),
            );
          },
        );
        print('Request failed with status: ${response.body}.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 18),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Assets/Images/images14.webp"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        // width:47.w ,
                        child: Pinput(
                          controller: otpController,
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          defaultPinTheme: PinTheme(
                              height: 10.h,
                              width: 12.w,
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black38,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black.withOpacity(1),
                                    width: 1,
                                  )
                                  // borderRadius: BorderRadius.circular(50),

                                  )),
                        ),
                      ),
                      SizedBox(height: 22),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            otpVerify(context, otpController.text);
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.purple,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 5.5.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          onChanged: (value) {
            setState(() {});
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.purple),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
