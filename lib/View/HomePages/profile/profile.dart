import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_project_/Service/ProfileServiceProvider/profData.dart';
import 'package:main_project_/View/HomePages/LoginPages/LogIn.dart';
import 'package:main_project_/View/HomePages/home.dart';
import 'package:main_project_/View/HomePages/profile/acDetails.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => Home()));
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 55.sp,
                  backgroundImage: AssetImage(
                    'Assets/Images/kid2.jpg',
                  ),
                ),
              ),
              Positioned(
                right: 120,
                bottom: 10,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Consumer<ProfileProvider>(builder:
              (BuildContext context, ProfileProvider value, Widget? child) {
            log('+++++++++++++++++++++++++++++${value.data.data!.name}');
            return Text(value.data.data!.name.toString());
          }),
          Positioned(
            right: 40,
            top: 80,
            child: Consumer<ProfileProvider>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(value.data.data!.phoneno.toString());
              },
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: profileRow('Your Profile', Icons.person),
              ),
              Divider(),
              profileRow('Payment Methods', Icons.payment),
              Divider(),
              profileRow('My Orders', Icons.shop),
              Divider(),
              profileRow('Settings', Icons.settings),
              Divider(),
              profileRow('Privacy Policy', Icons.lock),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: profileRow('Log Out', Icons.logout),
              ),
            ],
          ),
        ])));
  }
}

Padding profileRow(String name, IconData icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(
          name,
          style: TextStyle(fontSize: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios_outlined),
        ),
      ],
    ),
  );
}
