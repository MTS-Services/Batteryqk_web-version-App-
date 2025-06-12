import 'package:batteryqk_web_app/auth_chack.dart';
import 'package:batteryqk_web_app/localization/localization.dart';
import 'package:batteryqk_web_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        home:AuthCheck(),
        locale: Locale('en','US'),
        fallbackLocale: Locale('en','US'),
        translations: Language(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(

            canvasColor: Colors.white,
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:AppColor.blueColor),
                borderRadius: BorderRadius.circular(6),
              ),
      
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(6),
              ),
      
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                color: Color(0xFF374151),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
        ),
      ),
    );
  }
}
