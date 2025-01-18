import 'package:flutter/material.dart';

///this class aims to define the proportional size of a Widget
///depends on the size of the screen width and screen height
///
///you need to call this inside the [Widget] build function like this:
///- SizeConfig().init(context);
///
///@function :
///- [void] init()
///
///create on January 18th, 2025
class SizeConfig {
  ///this variable is used to store the instance of MediaQueryData
  static late MediaQueryData _mediaQueryData;

  ///this variable is used to store the screen width
  static late double screenWidth;

  ///this variable is used to store the screen height
  static late double screenHeight;

  ///this variable is used to store the default size of the device
  static double? defaultSize;

  ///this variable is used to store the device orientation
  static Orientation? orientation;

  ///this variable is used to store the value of screen width divided by 100
  static double? blockHorizontal;

  //this variable is used to store the value of screen height divided by 100
  static double? blockVertical;

  ///this function aims to initialize the value of variable
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    blockHorizontal = screenWidth / 100;
    blockVertical = screenHeight / 100;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 640 is the layout height that designer use
  return (inputHeight / 640.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 360 is the layout width that designer use
  return (inputWidth / 360.0) * screenWidth;
}
