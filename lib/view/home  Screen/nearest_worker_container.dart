import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/Common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../../utils/constant/app_string.dart';

class NearestServices extends StatelessWidget {
  final String?  image;
  final String?  title;
  final String?  far;
  final String? rating;
  final String? price;

  const NearestServices({super.key, this.image, this.title, this.far, this.rating, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.h,
      decoration: BoxDecoration(
        color: AppColor.appContainerColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(8.h),
        child: Row(
          children: [
            Image.asset(image??AppImages.laundryPerson),
            SizedBox(
              width: 16.h,
            ),
            servicesDetails(),
          ],
        ),
      ),
    );
  }
  Widget servicesDetails () {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(
          text: title??AppText.cleaner,
          fontWeight: FontWeight.w500 ,
          textColor: AppColor.appFont,
          fontSize: 16.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.location,color: AppColor.appBannerColor,height: 18.h,),
            SizedBox(
              width: 4.h,
            ),
            CustomText(
              text: far??AppText.cleaningFar,
              fontWeight: FontWeight.w400 ,
              textColor: const Color(0xFF707070),
              fontSize: 16.sp,
            ),
            SizedBox(
              width: 16.h,
            ),
            Image.asset(AppImages.star,height: 20.h,),
            SizedBox(
              width: 4.h,
            ),
            CustomText(
              text: rating??AppText.cleaningStar,
              fontWeight: FontWeight.w400 ,
              textColor: const Color(0xFF707070),
              fontSize: 16.sp,
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            text: price?? AppText.cleaningRate,
            style: TextStyle(
              color: AppColor.appFont,
              fontSize: 16.sp,
              fontFamily: 'CircularStd',
              fontWeight: FontWeight.w500,
            ),
            children:  <TextSpan>[
              TextSpan(text: AppText.pcs,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF707070),
                    fontSize: 14.sp,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
