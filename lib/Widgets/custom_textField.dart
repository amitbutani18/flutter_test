import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_project_k/Widgets/text_widget.dart';
import 'package:sizer/sizer.dart';

import '../utils/Constants/app_font.dart';
import '../utils/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool withAsterisk;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onSuffixTap;
  final void Function()? ontap;

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? lableColor;

  const CustomFormField(
      {Key? key,
      this.textInputType = TextInputType.text,
      this.withAsterisk = false,
      this.obscureText = false,
      this.readOnly = false,
      this.inputFormatters,
      this.controller,
      this.enabled = true,
      this.validator,
      this.onSuffixTap,
      this.ontap,
      this.suffixIcon,
      this.lableColor,
      required this.hintText,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: enabled,
          readOnly: readOnly,
          controller: controller,
          cursorColor: Colors.blue,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          validator: validator,
          onTap: ontap,
          style: TextStyle(
              fontSize: 11.sp,
              fontFamily: AppFont.golos,
              color: Color(0xff3E4A4C)),
          decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              isDense: true,
              prefixIcon: prefixIcon,
              fillColor: AppColors.whiteColor,
              // labelStyle: TextStyle(fontFamily: golosBlack, fontSize: 11.sp),
              hintStyle: TextStyle(
                  color: Color(0xff758285),
                  fontSize: 10.sp,
                  fontFamily: AppFont.golos),
              suffixIcon: suffixIcon ??
                  GestureDetector(
                      onTap: onSuffixTap,
                      child: Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(Icons.search),
                      )),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 25, maxWidth: 30),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(5)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(5)),
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.whiteColor),
                  borderRadius: BorderRadius.circular(5)),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.pink),
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? suffixOnTap;
  final void Function(String)? onChange;
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final TextEditingController? controller;

  // final Widget? suffixWidget;
  const CustomTextField({
    Key? key,
    this.onTap,
    required this.hintText,
    this.onChange,
    this.suffixOnTap,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    // this.suffixWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        onChanged: onChange,
        style: TextStyle(
            fontSize: 11.sp,
            fontFamily: AppFont.golos,
            color: Color(0xff3E4A4C)),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 11.sp,
                fontFamily: AppFont.golos,
                color: Color(0xff758285)),
            filled: true,
            contentPadding: const EdgeInsets.only(left: 15, right: 15),
            fillColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(color: AppColors.whiteColor)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.whiteColor),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 14, top: 14, bottom: 14, right: 8),
                    child: Image.asset(prefixIcon!),
                  )
                : const SizedBox(),
            suffixIconConstraints: const BoxConstraints(maxHeight: 20)

            // suffixIcon != null ? Image.asset(suffixIcon!) : SizedBox()
            ),
      ),
    );
  }
}

class CustomMobileField extends StatelessWidget {
  final String label;
  final String hintText;
  // final String errorText;
  final bool withAsterisk;
  final TextEditingController? countyController;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Widget countryCodeWidget;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;

  final String? Function(String?)? validator;

  const CustomMobileField({
    Key? key,
    required this.label,
    this.textInputType = TextInputType.phone,
    this.withAsterisk = false,
    this.inputFormatters,
    this.countyController,
    // required this.errorText,
    this.controller,
    this.enabled = true,
    this.validator,
    required this.hintText,
    required this.countryCodeWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 9.sp,
              fontFamily: AppFont.golosSemiBold,
              color: Color(0xff3E4A4C)),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  height: 6.h,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: countryCodeWidget),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 8,
              child: SizedBox(
                // height: 6.h,
                child: TextFormField(
                  enabled: enabled,
                  controller: controller,
                  keyboardType: textInputType,
                  inputFormatters: inputFormatters,
                  validator: validator,
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: AppFont.golos,
                      color: Color(0xff3E4A4C)),
                  decoration: InputDecoration(
                      // errorText: errorText,
                      hintText: hintText,
                      filled: true,
                      isDense: true,
                      fillColor: AppColors.whiteColor,
                      hintStyle: TextStyle(
                          color: Color(0xff758285),
                          fontSize: 12,
                          fontFamily: AppFont.golos),
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(5)),
                      disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(5)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.pink),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
