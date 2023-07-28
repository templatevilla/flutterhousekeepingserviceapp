import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_services/utils/Common/app_button.dart';
import 'package:house_services/utils/Common/app_space.dart';
import 'package:house_services/utils/Common/custom_text.dart';
import 'package:house_services/utils/constant/app_color.dart';
import 'package:house_services/utils/constant/app_image.dart';
import 'package:house_services/utils/constant/app_string.dart';
import 'package:house_services/view/details%20Screen/pickup_date.dart';
import 'package:house_services/view/details%20Screen/pickup_model.dart';
import 'package:house_services/view/details%20Screen/pickup_time.dart';
import 'package:house_services/view/home%20%20Screen/work_categories_model.dart';
import 'order_item.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final ServicesDetails servicesDetails;
  const ServiceDetailsScreen({super.key, required this.servicesDetails});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}
class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {

  bool item1= true;
  bool item2= true;
  bool item3= false;
  bool isPressed = false;
  int dayIndex = 0;
  bool isPressedDate = false;
  int dateIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return  Scaffold(
        extendBodyBehindAppBar: false,
      backgroundColor: AppColor.appColor,
      body:Column(
        children: [
          servicesImage(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                serviceNameAndLocation(),
                AppSpace(
                  height: 24.h,
                ),
                orderItems(),
                AppSpace(
                  height: 24.h,
                ),
                pickUpDateText(),
                dateAndDays(),
                AppSpace(
                  height: 24.h,
                ),
                pickUpTimeText(),
                selectTime(),
                AppSpace(
                  height: 34.h,
                ),
                totalPrice(),
                AppSpace(
                  height: 16.h,
                ),
                bookNowButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget  servicesImage(){
    return Stack(
      children: [
        Image.asset(AppImages.detailsBack),
        Container(
          height: 240.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x87000000),
                Color(0x00000000),
              ],),
          ),
        ),
        Positioned(
            top: 50.h,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded,size: 24.h,color: AppColor.appColor,)),
                  // Spacer(),Si
                  SizedBox(
                    width: 344.h,
                  ),
                  Image.asset(AppImages.bookMark,height: 24.h,width: 24.h,)
                ],
              ),
            )),
      ],
    );
  }
  Widget  serviceNameAndLocation (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                text: AppText.bestFind,
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                textColor: AppColor.appFont,
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              Image.asset(AppImages.star,height: 20.h,width: 20.h,),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: widget.servicesDetails.rating,
                textAlign: TextAlign.start,
                textColor: const Color(0xFF707070),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ],
          ),
          AppSpace(
            height: 8.h,
          ),
          Row(
            children: [
              Image.asset(AppImages.location,height: 20.h,width: 20.h,color: AppColor.appBannerColor,),
              SizedBox(
                width: 4.h,
              ),
              CustomText(
                text: AppText.currentLocation,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start,
                textColor: AppColor.subColor,
              )
            ],
          ),
        ],
      ),
    );
  }
  Widget orderItems (){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child:SizedBox(
        height: 120.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppText.orderItem,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              textColor: AppColor.appFont,
              textAlign: TextAlign.start,
            ),
            SelectOrderItem(checkData: item1,item: AppText.item1,),
            SelectOrderItem(checkData: item2,item: AppText.item2,),
            SelectOrderItem(checkData: item3,item: AppText.item3,),
          ],
        ),
      ) ,);
  }
  Widget pickUpDateText (){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomText(
        text: AppText.pickupDate,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        textAlign: TextAlign.start,
        textColor: AppColor.appFont,
      ),
    );
  }
  Widget dateAndDays (){
    return SizedBox(
      height: 89.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 20.h,top: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                dayIndex = index;
                isPressed = !isPressed;
              });
            },
            child: PickUpDate(
                day: pickUpdate[index].day,
                date: pickUpdate[index].date,
                isPressed: dayIndex==index),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 16.h,
          ),
          itemCount: pickUpdate.length),
    );
  }
  Widget pickUpTimeText (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: CustomText(
        text: AppText.pickupTime,
        fontWeight: FontWeight.w700,
        fontSize: 20.sp,
        textAlign: TextAlign.start,
        textColor: AppColor.appFont,
      ),
    );
  }
  Widget selectTime (){
    return SizedBox(
      height: 66.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 20.h,top: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                dateIndex = index;
                isPressedDate = !isPressedDate;
              });
            },
            child: PickUpTime(
                time: pickupTime[index],
                isPressed: dateIndex==index),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 16.h,
          ),
          itemCount: pickupTime.length),
    );
  }
  Widget totalPrice (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text:AppText.totalPrice,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.start,
            textColor: AppColor.subColor,
          ),
          CustomText(
            text:AppText.price,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.end,
            textColor: AppColor.appFont,
          ),
        ],
      ),
    );
  }
  Widget bookNowButton (){
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const AppButton(
        buttonText: AppText.bookNow,
      ),
    );
  }
}
