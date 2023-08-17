import 'package:aduadshop/common/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aduadshop/common/brand_colors.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'HomeScreen/Bindings/HomeBindings.dart';
import 'HomeScreen/HomeView/MainHomeScreen.dart';
import 'Routes/routes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'aduashiop',
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: BrandColors.kred,
            ),
            initialBinding: HomeBinding(),
            home: MainHomeScreen(),
            getPages: AppRoutes.pages,

          );
        }
    );
  }
}