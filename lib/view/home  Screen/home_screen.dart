import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_services/utils/Common/app_space.dart';
import 'package:house_services/utils/Common/custom_text.dart';
import 'package:house_services/utils/constant/app_color.dart';
import 'package:house_services/utils/constant/app_image.dart';
import 'package:house_services/view/home%20%20Screen/app_banner.dart';
import 'package:house_services/view/home%20%20Screen/nearest_worker_container.dart';
import 'package:house_services/view/home%20%20Screen/work_categories.dart';
import 'package:house_services/view/home%20%20Screen/work_categories_model.dart';
import 'package:house_services/view/details%20Screen/service_details_screen.dart';

import '../../utils/constant/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int i=0;
  int service=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: AppColor.appColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
           AppSpace( height: 16.h,
           ),
            appBar(),
            slider(),
            SizedBox(height: 10.h,),
            dotIndicator(),
            AppSpace(height: 16.h,
            ),
            categoriesText(),
            serviceCategories(),
            nearestLaundryText(),
            servicesInfoList(),
          ],
        ),
      ),
    );
  }
  Widget  appBar (){ return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 20.sp,
                textAlign: TextAlign.start,
                text: 'Hello,',
              ),
              const Spacer(),
              Image.asset(AppImages.bell,height: 24.h,),
              SizedBox(
                width: 16.h,
              ),
              Image.asset(AppImages.search,height: 24.h,),
            ],
          ),
          Row(
            children: [
              Image.asset(AppImages.location,height: 16.h,),
              SizedBox(
                width: 8.h,
              ),
              CustomText(
                textColor: AppColor.appFont,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                textAlign: TextAlign.start,
                text: AppText.currentLocation,
              ),


            ],
          ),

        ],
      ),
    ); }
  Widget dotIndicator (){
    return DotsIndicator(
      dotsCount: 5,
      position: i,
      decorator: DotsDecorator(

        size:  Size.square(8.0.h),
        activeSize:  Size(8.0, 8.0.h),
        color: const Color(0xFFEAEAEA),
        spacing: EdgeInsets.symmetric(horizontal: 4.h),
        activeColor:  AppColor.appBannerColor,
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.r)),
      ),
    );
  }
  Widget  categoriesText (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.categories,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
  Widget serviceCategories (){
    return SizedBox(
      height: 117.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal:20.h,vertical: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
            image: categoriesModel[index].image,
            type: categoriesModel[index].name,
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 24.h,
          ),
          itemCount: categoriesModel.length),
    );
  }
  Widget nearestLaundryText (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: AppText.nearestLaundry,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            textColor: AppColor.appFont,
            fontSize: 20.sp,
          ),
          CustomText(
            text: AppText.view,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
  Widget servicesInfoList (){
    return SizedBox(
      height: 454.h,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
          separatorBuilder: (context, index) => AppSpace(
            height: 16.h,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  ServiceDetailsScreen(
                  servicesDetails: servicesDetails[index],
                ),));
              },
              child: NearestServices(
                image: servicesDetails[index].image,
                title: servicesDetails[index].title,
                far: servicesDetails[index].placeFar,
                rating: servicesDetails[index].rating,
                price: servicesDetails[index].rate,
              ),
            );
          },
          itemCount: servicesDetails.length),
    );
  }
  Widget slider (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: CarouselSlider.builder(

        options: CarouselOptions(

          height: 160.0.h,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16/8,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              i = index;
            });
          },

        ), itemCount: 5, itemBuilder: (BuildContext context, int index, int realIndex) {

        return const AppBanner();
      },
      ),
    );
  }
}
