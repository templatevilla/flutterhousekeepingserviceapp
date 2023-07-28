import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/Common/custom_text.dart';
import '../../utils/constant/app_color.dart';

class PickUpTime extends StatelessWidget {
  final bool  isPressed ;
  final String?   time ;
  const PickUpTime({super.key, required this.isPressed, this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40.h,
        decoration: BoxDecoration(
          color:isPressed?const Color(0x080e5c46):AppColor.appContainerColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color:isPressed?AppColor.appBannerColor: const Color(0xFFF5F5F5),),
        ),
        child: times(),
    );
  }

  Widget times (){
     return Padding(
       padding:  EdgeInsets.all(16.h),
       child: Center(
         child: CustomText(
           text: time??'8:30 AM',
           textColor:isPressed?AppColor.appBannerColor: AppColor.subColor,
           textAlign: TextAlign.center,
           fontSize: 16.sp,
           fontWeight: FontWeight.w400,
         ),
       ),
     );
  }
}
