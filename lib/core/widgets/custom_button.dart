import 'package:flutter/material.dart';

import '../utils/color.dart';
class CustomButton extends StatelessWidget {
   CustomButton({
     super.key,
      this.bgcolor,
      this.textcolor,
     this.width,
     this.height,
     required this.text,
     required this.onPresse});

  Color ? bgcolor;
  Color? textcolor;
  double ? width;
  double ? height;
  String  text;
  final Function() onPresse;



  @override
  Widget build(BuildContext context) {
    Size mediaquery = MediaQuery.of(context).size;
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal:width ?? mediaquery.width*.2,
              vertical:height ?? mediaquery.height*.02
          ),
          backgroundColor: bgcolor?? AppColor.purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
     // onPressed:(){},
      onPressed:onPresse,
      child: Text(text,style: TextStyle(
        color:textcolor?? AppColor.whiteColor,
        fontSize: mediaquery.width*.04
    ),),);
  }
}
