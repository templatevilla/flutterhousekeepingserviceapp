import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_string.dart';

class PickUpDate extends StatelessWidget {
  final bool  isPressed ;
  final String? day;
  final String? date;
  const PickUpDate({super.key, required this.isPressed, this.day, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72.h,
        width: 60.h,
        decoration: BoxDecoration(
          color:isPressed?const Color(0x080e5c46):AppColor.appContainerColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color:isPressed?AppColor.appBannerColor: const Color(0xFFF5F5F5),),
        ),
        child: dayAndDate(),
    );
  }
  Widget dayAndDate (){
    return Padding(
      padding:  EdgeInsets.all(8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: day??AppText.sun,
            textColor:isPressed?AppColor.appBannerColor: AppColor.subColor,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          CustomText(
            text: date??'7',
            textColor:isPressed?AppColor.appBannerColor: AppColor.subColor,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
