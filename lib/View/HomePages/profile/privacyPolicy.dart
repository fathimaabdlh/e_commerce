import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(child: Column(
        children: [
          Text('Personal Information: We may collect personal information such as your name, email address, phone number, shipping address, and payment details when you register an account or make a purchase on AspireFinds')
        


       
        ],
      )),
    );
  }
}