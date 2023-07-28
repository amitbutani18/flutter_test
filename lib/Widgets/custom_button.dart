// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../utils/Constants/app_font.dart';
import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color fontColor;
  final fontsize;
  final String text;
  final void Function()? onPressed;
  final double buttonHeight;
  final double buttonWidth;
  final bool isTwoChild;
  final String? iconAsset;
  final Color? iconColor;
  const CustomButton({
    Key? key,
    this.buttonColor = AppColors.buttonColor,
    this.fontColor = AppColors.whiteColor,
    required this.text,
    this.fontsize,
    this.buttonHeight = 50,
    this.buttonWidth = 200,
    this.isTwoChild = false,
    this.onPressed,
    this.iconAsset,
    this.iconColor = AppColors.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)))),
          backgroundColor: MaterialStateProperty.all(buttonColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isTwoChild
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    iconAsset!,
                    height: 14,
                    color: iconColor,
                  ),
                )
              : const SizedBox(),
          Text(
            text,
            style: TextStyle(
                color: fontColor,
                fontFamily: AppFont.golosMedium,
                letterSpacing: 0.3,
                fontSize: 14),
          ),
        ],
      ),
    );
  }
}
