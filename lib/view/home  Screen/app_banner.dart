import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/Common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../../utils/constant/app_string.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  banner();
  }
  Widget banner (){
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 140.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFDAFFF5),
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.only(left: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: '40% Off',
                fontSize: 19.sp,
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                width: 199.h,
                child: CustomText(
                  text: AppText.bannerText,
                  textColor: AppColor.appFont,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(height: 16.h,),
              Container(
                height: 32.h,
                width: 119.h,
                decoration: BoxDecoration(
                  color: AppColor.appBannerColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Center(
                  child: CustomText(
                    text: AppText.bookNow,
                    textColor: AppColor.appColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(

            right: 7.h,
            child: Image.asset(AppImages.bannerImage,height: 156.h,)),
      ],
    );
  }

}
