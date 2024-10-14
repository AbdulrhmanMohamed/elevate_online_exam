import 'package:flutter/material.dart';

class Styles {
  

static  TextStyle _getStyle(double fontSize,Color color,{required FontWeight fontWeight}){
      return TextStyle(
        fontSize: fontSize,
        color: color,
        
      );
  }

 static TextStyle get_regular(double fontSize,Color color){
      return _getStyle(fontSize, color, fontWeight: FontWeight.w400);
  }
 static TextStyle get_bold(double fontSize,Color color){
      return _getStyle(fontSize, color, fontWeight: FontWeight.w700);
  }
 static TextStyle get_light(double fontSize,Color color){
      return _getStyle(fontSize, color, fontWeight: FontWeight.w300);
  }


}
