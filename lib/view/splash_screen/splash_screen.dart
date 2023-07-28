import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_services/utils/Common/app_button.dart';
import 'package:house_services/utils/Common/app_space.dart';
import 'package:house_services/utils/Common/custom_text.dart';
import 'package:house_services/utils/constant/app_string.dart';
import 'package:house_services/view/botoom%20bar/bottom_bar.dart';
import '../../custom/half_circle_custom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void updateAppbar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark );
  }
  @override
  void initState() {
    // TODO: implement initState
    updateAppbar();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            splashImage(),
           AppSpace(
             height: 15.h,
           ),
            splashDetails(),
            const Spacer(),
            getStartedButton(),
            AppSpace(
              height: 36.h,
            ),
      ]),
    );
  }

  Widget splashImage (){
    return  ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        clipBehavior: Clip.none,
        width: MediaQuery.of(context).size.width,
        height: 629.h,
        child: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),
      ),
    );
  }

  Widget splashDetails(){
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appMotive,
            textAlign: TextAlign.center,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        AppSpace(
          height: 16.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h),
          child: CustomText(
            text: AppText.appDescription,
            textAlign: TextAlign.center,
            fontSize: 16.sp,
            textColor: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  Widget getStartedButton(){
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => const BottomBar(),));
      },
      child: const AppButton(
        buttonText: 'Get Started',
      ),
    );
  }
}
