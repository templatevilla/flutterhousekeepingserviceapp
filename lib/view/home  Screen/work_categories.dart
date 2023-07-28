import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Common/app_space.dart';
import '../../utils/Common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../../utils/constant/app_string.dart';

class Categories extends StatelessWidget {
  final String? image;
  final String? type;

  const Categories({super.key, this.image, this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox (
      height: 86.h,
      width: 65.h,
      child: Column(
        children: [
          categoriesImage(),
          AppSpace(
            height: 8.h,
          ),
          categoriesType(),

        ],
      ),
    );
  }
  Widget categoriesImage (){
    return Container(
      height: 60.h,
      width: 80.h,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.appContainerColor,
      ),
      child: Padding(
        padding:  EdgeInsets.all(12.h),
        child: Image.asset(image??AppImages.cleaning,height: 32.h,),
      ),
    );
  }
  Widget categoriesType (){
    return  CustomText(
      text:type?? AppText.cleaning,
      fontSize: 13.sp,
      textColor: AppColor.appFont,
      fontWeight: FontWeight.w400,
    );
  }
}
