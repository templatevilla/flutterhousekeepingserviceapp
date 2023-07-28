import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:house_services/view/splash_screen/splash_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'CircularStd',
            ),
            title: 'Home Service',
            home: const SplashScreen(),
          );
        }
    );
  }
}

