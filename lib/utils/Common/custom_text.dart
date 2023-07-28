

import 'package:flutter/cupertino.dart';

import '../constant/app_color.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
   const CustomText({super.key, this.text, this.textColor, this.fontSize, this.fontWeight, this.textAlign, });

  @override
  Widget build(BuildContext context) {
    return Text(text!,style: TextStyle(
      color: textColor ??AppColor.appFont,
      fontWeight: fontWeight??FontWeight.w700,
      fontSize:fontSize,
      fontFamily: 'CircularStd',

    ),textAlign:textAlign?? TextAlign.center,);
  }
}
