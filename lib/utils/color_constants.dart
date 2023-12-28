import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#747688');

  static Color whiteA7004c = fromHex('#4cffffff');

  static Color indigoA20065 = fromHex('#655668ff');

  static Color gray500 = fromHex('#9799a5');

  static Color blueGray400 = fromHex('#888888');

  static Color gray900 = fromHex('#110c26');

  static Color gray90001 = fromHex('#0d0c26');

  static Color blueGray500 = fromHex('#6f6d8f');

  static Color blueGray60011 = fromHex('#1152588f');

  static Color indigoA200 = fromHex('#5668ff');

  static Color indigo3003f = fromHex('#3f6f7dc8');

  static Color lightIndigo = fromHex('#E9EBF9');

  static Color orange200 = fromHex('#ffcd6b');

  static Color indigo300 = fromHex('#7974e7');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color black90075 = fromHex('#75000000');

  static Color black90000 = fromHex('#00000000');

  static Color gray900A6 = fromHex('#a6110c26');

  static Color black900 = fromHex('#000000');

  static Color black90096 = fromHex('#96000000');

  static Color indigoA400 = fromHex('#3d55f0');

  static Color whiteA700 = fromHex('#ffffff');

  static Color blueGray6000f = fromHex('#0f575c8a');

  static Color indigoA20063 = fromHex('#635668ff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
