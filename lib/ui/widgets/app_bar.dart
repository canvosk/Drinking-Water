
import 'package:drinking_water/ui/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

AppBar myAppBar(){
  return AppBar(
    backgroundColor: bgColor,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
    ),
    title: Text("Ne Kadar Su İçtim?", style: TextStyle(color: textColor),),
  );
}