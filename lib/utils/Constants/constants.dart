import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sizer/sizer.dart';

import '../app_colors.dart';

String golos = "golos";
String golosBlack = "golos black";
String golosBold = "golos bold";
String golosSemiBold = "golos semibold";

void hideProgress() => Get.back();

Widget setProfileImage(
    {String? name,
    String? image,
    double? size,
    Color? textColor,
    Color? boxColor}) {
  if (image == "") {
    return Container(
      height: size ?? 40,
      width: size ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: boxColor ?? AppColors.black26Color,
      ),
      child: Center(
        child: Text(
          name?.substring(0, 1).capitalizeFirst ?? "",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: textColor,
              fontFamily: golosSemiBold),
        ),
      ),
    );
  } else {
    return Container(
      height: size ?? 40,
      width: size ?? 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.black26Color,
          image: DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)),
    );
  }
}

List hashtag = ['#2023', "#TODAYISMONDAY", "#TOP", "#POPS!", "#WOW", "#ROW"];
