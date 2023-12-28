import 'package:flutter/material.dart';

import 'color_constants.dart';

class AppDecoration {
  static BoxDecoration get outlineBluegray6000f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blueGray6000f,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get gradientWhiteA70000WhiteA700 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(
            0.5,
            0,
          ),
          end: Alignment(
            0.5,
            1,
          ),
          colors: [
            ColorConstant.whiteA70000,
            ColorConstant.whiteA700,
          ],
        ),
      );
  static BoxDecoration get fillOrange200 => BoxDecoration(
        color: ColorConstant.orange200,
      );
  static BoxDecoration get outlineIndigo3003f => BoxDecoration(
        color: ColorConstant.indigoA200,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.indigo3003f,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              10,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBluegray60011 => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.blueGray60011,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(
              0,
              8,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillWhiteA7004c => BoxDecoration(
        color: ColorConstant.whiteA7004c,
      );
}

class BorderRadiusStyle {
  static BorderRadius roundedBorder16 = BorderRadius.circular(
    16,
  );

  static BorderRadius roundedBorder10 = BorderRadius.circular(
    10,
  );
}
