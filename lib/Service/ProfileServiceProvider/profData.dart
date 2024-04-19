// ignore_for_file: unused_import, prefer_interpolation_to_compose_strings
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:main_project_/Model/profileModel/prof_get/data.dart';
import 'package:main_project_/Model/profileModel/prof_get/prof_get.dart';
import 'package:main_project_/Service/ProfileServiceProvider/profileService.dart';

class ProfileProvider extends ChangeNotifier {
  final service = ProfileService();
  bool isloading = false;
  ProfGet _data = ProfGet();
  ProfGet get data => _data;
  getAllPosts() async {
    isloading = true;
    notifyListeners();
    final res = await service.getAll();
    _data = res;

    log(data.data?.email ?? "".toString() + "-----------------------......");
    isloading = false;
    log(isloading.toString() + "--------------");
    notifyListeners();
  }
}
