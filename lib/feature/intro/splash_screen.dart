import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utils/text_style.dart';
import 'package:todo/feature/upload/upload_screen.dart';
import '../../core/functions/newNavigation.dart';
import '../../core/utils/color.dart';


class SplashScreen extends StatefulWidget {
  static const String routeApp="/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
     void initState() {
       Timer(const Duration(seconds: 5),
             () {
               pushWithReplacement(
                 context,
                 const UploadScreen(),
               );
         },);
       // TODO: implement initState
       super.initState();
     }

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/images/logo.json'),
            Text("Taskati",style: gettitleTextStyle(fontsize: 24,color: AppColor.purpleColor),
            ),
            Text("Your Personal Task Manager",style: gettitleTextStyle(color: AppColor.greyColor ),),

            SizedBox(height: mediaquery.height*.05,),
            CircularProgressIndicator(color: AppColor.purpleColor,),

          ],
        ),
      ),

    );
  }
}
