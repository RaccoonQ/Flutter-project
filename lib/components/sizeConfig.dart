import 'package:flutter/material.dart';

class SizeConfig {
  // @override
  static MediaQueryData _mediaQueryData;

  static double pxRatio;
  static double logicalPx;

  static double width; // screen width
  static double height; // screen height
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double safeAreaHorizontal;
  static double safeAreaVertical;
  static double safeBlockHorizontal;
  static double safeBlockVertical;
  static double textScaleFactor;

  static double hRatio; //horizontal ratio based on iPhone SE
  static double vRatio; //vertical ratio based on iPhone SE
  static double tRatio; //text ration based on iPhone SE

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    pxRatio = _mediaQueryData.devicePixelRatio;
    logicalPx = pxRatio / WidgetsBinding.instance.window.devicePixelRatio;

    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
    blockSizeHorizontal = width / 100;
    blockSizeVertical = height / 100;

    safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (width - safeAreaHorizontal) / 100;
    safeBlockVertical = (height - safeAreaVertical) / 100;

    hRatio = (width / 375);
    vRatio = (height / 812);
    tRatio = MediaQuery.of(context).textScaleFactor;
  }
}
