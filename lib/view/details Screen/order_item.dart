import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_services/utils/constant/app_color.dart';
import 'package:house_services/utils/constant/app_image.dart';
import '../../utils/Common/custom_text.dart';

// ignore: must_be_immutable
class SelectOrderItem extends StatefulWidget {
   bool checkData;
   String item;
   SelectOrderItem({super.key, required this.checkData,required this.item});
  @override
  State<SelectOrderItem> createState() => _SelectOrderItemState();
}

class _SelectOrderItemState extends State<SelectOrderItem> {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          setState(() {
            widget.checkData = !widget.checkData;
          });
        },
        child: Row(
          children: [
            checkBox(),
            SizedBox(
              width: 17.sp,
            ),
            CustomText(
              text: widget.item,
              textColor: AppColor.subColor,
              textAlign: TextAlign.start,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      );
  }
  Widget checkBox (){
   return   Container(
     height: 20.h,
     width: 20.h,
     decoration: BoxDecoration(
       borderRadius:BorderRadius.circular(4.r),
       color: widget.checkData? AppColor.appBannerColor:AppColor.appContainerColor,
     ),
     child: widget.checkData
         ?  Padding(
       padding:  EdgeInsets.all(4.h),
       child: Image.asset(AppImages.right,color: AppColor.appColor,),
     )
         : const SizedBox(),
   );
  }
}
