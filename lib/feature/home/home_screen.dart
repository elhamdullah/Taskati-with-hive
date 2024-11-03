import 'dart:io';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/core/utils/text_style.dart';

import '../../core/functions/newNavigation.dart';
import '../../core/utils/color.dart';
import '../add_task/add_new_task.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime focusDate = DateTime.now();
    String date=DateFormat.yMMMMd().format(DateTime.now());
    Size mediaquery=MediaQuery.of(context).size;
    var box=Hive.box('user');



    return Scaffold(
      backgroundColor: ThemeMode.light == ThemeMode.light ? AppColor.whiteColor : AppColor.blackColor,
      //backgroundColor: constant_color.blackColor,
      appBar: AppBar(
        //iconTheme: IconThemeData(color: AppColor.blackColor,),
        toolbarHeight: mediaquery.height*.075,
        backgroundColor: ThemeMode.light == ThemeMode.light ? AppColor.whiteColor : AppColor.blackColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Hello, ",style: gettitleTextStyle(fontsize: mediaquery.width*.052),),
                Text(box.get('name'??''),style: gettitleTextStyle(fontsize: mediaquery.width*.052),),
              ],
            ),
            Text("Have A Nice Day. ", style: gettitleTextStyle(fontWeight: FontWeight.normal,color: AppColor.greyColor),),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.purpleColor),
            ),
            child: CircleAvatar(
              radius: mediaquery.width*.08,
              backgroundImage: FileImage(File(box.get('image')??"")),
            ),
          ),
          SizedBox(width: mediaquery.width*.02,),
        ],
      ),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(date,style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: mediaquery.width*.06,
                        fontWeight: FontWeight.bold
                    ),),
                    Text((DateFormat.E().format(focusDate))==(DateFormat.E().format(focusDate))? "Today":DateFormat.E().format(focusDate)
                        ,style: TextStyle(
                            color: ThemeMode.light == ThemeMode.light ? AppColor.blackColor : AppColor.whiteColor,
                            fontSize: mediaquery.width*.06,
                            fontWeight: FontWeight.bold
                        )),
                  ],
                ),

                SizedBox(width: mediaquery.width*.1,),

                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: AppColor.purpleColor,
                      foregroundColor: AppColor.whiteColor,
                    ),
                    onPressed: () {
                      pushTo(context, AddNewTask());
                      },
                    icon: const Icon(Icons.add),
                    label: const Text(
                        "Add Task"
                    )
                ),
              ],
            ),

            SizedBox(height: mediaquery.height*.02,),

            EasyInfiniteDateTimeLine(
              activeColor: AppColor.purpleColor,

              //controller: _controller,
              showTimelineHeader: false,
              dayProps: EasyDayProps(
                width: mediaquery.width*.22,
                dayStructure: DayStructure.monthDayNumDayStr,
                activeDayStyle:  DayStyle(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: AppColor.purpleColor,

                  ),
                ),
              ),
              firstDate: DateTime(2024),
              focusDate: focusDate,
              lastDate: DateTime(2025, 12, 31),
              onDateChange: (selectedDate) {
                setState(() {
                  // focusDate = selectedDate;
                  selectedDate=focusDate;
                });
              },


            ),

            SizedBox(height: mediaquery.height*.02,),
            Lottie.asset('assets/images/empty.json'),
          ],
        ),
      ),
    );
  }
}
