import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/utils/text_style.dart';
import '../../core/utils/color.dart';
import '../../core/widgets/color_container.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/textfieldflorm_widget.dart';

class AddNewTask extends StatefulWidget {
   AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  DateTime date = DateTime.now();
   var formattedDate;
   var startDate;
   var endDate;

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: Text("Add Task",style: gettitleTextStyle(fontsize: mediaquery.width*.06),),
        centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(Icons.arrow_back_ios, color: AppColor.purpleColor,size: mediaquery.width*.07,),
          ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mediaquery.width*.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///---------------------------------------------title
            Text("Title",
              style: gettitleTextStyle(
                fontsize: mediaquery.width*.055,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: mediaquery.height*.01,),
            TextfieldflormWidget(
              isobsecure: false,
              hinttext: "Enter Title here",
            ),

            ///---------------------------------------------Note
            SizedBox(height: mediaquery.height*.02,),
            Text("Note",
              style: gettitleTextStyle(
                  fontsize: mediaquery.width*.055,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: mediaquery.height*.01,),
            TextfieldflormWidget(
              isobsecure: false,
              hinttext: "Enter Note here",
            ),

            ///---------------------------------------------Date
            SizedBox(height: mediaquery.height*.02,),
            Text("Date",
              style: gettitleTextStyle(
                  fontsize: mediaquery.width*.055,
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: mediaquery.height*.01,),
            TextfieldflormWidget(
              hinttext: formattedDate,
              isobsecure: false,
                suffixIcon: IconButton(icon: Icon(Icons.calendar_month,color: AppColor.purpleColor,),
                  onPressed: () async {
                      await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            date = selectedDate;
                            formattedDate =
                            DateFormat('MM/dd/yyyy').format(selectedDate);
                          });
                        }
                      }
                      );
                    }
                  ),

            ),

            ///---------------------------------------------Start date
            SizedBox(height: mediaquery.height*.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Start Date",
                  style: gettitleTextStyle(
                      fontsize: mediaquery.width*.055,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(width: 80,),
                Text("End Date",
                  style: gettitleTextStyle(
                      fontsize: mediaquery.width*.055,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(width: 50,),

              ],
            ),
            SizedBox(height: mediaquery.height*.01,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               SizedBox(
                 width: mediaquery.width*.4,
                 child: TextfieldflormWidget(
                   isobsecure: false,
                   hinttext: startDate,
                   suffixIcon: IconButton(onPressed: () async {
                     await showDatePicker(
                       context: context,
                       initialDate: date,
                       firstDate: DateTime(2022),
                       lastDate: DateTime(2030),
                     ).then((selectedDate) {
                       if (selectedDate != null) {
                         setState(() {
                           date = selectedDate;
                           startDate =
                               DateFormat('MM/dd/yyyy').format(selectedDate);
                         });
                       }
                     }
                     );
                   }, icon: Icon(Icons.access_time,color: AppColor.greyColor,)),

                 ),
               ),
               SizedBox(
                 width: mediaquery.width*.4,
                 child: TextfieldflormWidget(
                   isobsecure: false,
                   hinttext: endDate,
                   suffixIcon: IconButton(onPressed: () async {
                     await showDatePicker(
                       context: context,
                       initialDate: date,
                       firstDate: DateTime(2022),
                       lastDate: DateTime(2030),
                     ).then((selectedDate) {
                       if (selectedDate != null) {
                         setState(() {
                           date = selectedDate;
                           endDate = DateFormat('MM/dd/yyyy').format(selectedDate);
                         });
                       }
                     }
                     );
                   }, icon: Icon(Icons.access_time,color: AppColor.greyColor,)),
                 ),

               )
             ],
           ),

            ///---------------------------------------------color
            SizedBox(height: mediaquery.height*.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color",style: gettitleTextStyle(color: AppColor.blackColor,fontsize: mediaquery.width*.055,fontWeight: FontWeight.w600),),
                    SizedBox(height: mediaquery.height*.01,),
                    Row(
                      children: [
                        ColorContainer(
                          color: AppColor.purpleColor,
                          ischecked: true,
                        ),
                        SizedBox(width: mediaquery.width*.015,),
                        ColorContainer(
                          color: Colors.red,
                          ischecked: false,
                        ),
                        SizedBox(width: mediaquery.width*.015,),
                        ColorContainer(
                          color: AppColor.orangeColor,
                          ischecked: false,
                        ),
                      ],
                    )
                  ],
                ),
                CustomButton(
                 onPresse: (){},
                 text: "Create Task",
                  width: mediaquery.width*.07,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
