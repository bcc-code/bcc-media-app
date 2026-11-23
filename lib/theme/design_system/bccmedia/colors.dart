import 'dart:ui';

import 'package:bccm_core/design_system.dart';

class BccMediaColors extends DesignSystemColors {
  BccMediaColors()
    : super(
        tint1: const Color(0xff6EB0E6),
        tint1Dark: const Color(0xff6EB0E6),
        tint2: const Color(0xffE63C62),
        tint3: const Color(0xff71D2A4),
        onTint: const Color(0xffFFFFFF),
        label1: const Color(0xffFEFEFE),
        label2: const Color(0xffD9E0EB),
        label3: const Color(0xffB4C0D2),
        label4: const Color(0xff707C8E),
        background1: const Color(0xff0D1623),
        background2: const Color(0xff1D2838),
        separatorOnLight: const Color.fromRGBO(204, 221, 255, 0.1),
        separator2: const Color.fromRGBO(204, 221, 255, 0.1),
        messages: const DesignSystemMessageColors(
          info: MessageColors(
            background: Color.fromRGBO(22, 50, 74, 1),
            border: Color.fromRGBO(22, 50, 74, 1),
            text: Color.fromRGBO(228, 241, 251, 1),
            accent: Color.fromRGBO(110, 176, 230, 1),
          ),
          warning: MessageColors(
            background: Color.fromRGBO(61, 36, 0, 1),
            border: Color.fromRGBO(61, 36, 0, 1),
            text: Color.fromRGBO(252, 233, 199, 1),
            accent: Color.fromRGBO(251, 191, 36, 1),
          ),
          error: MessageColors(
            background: Color.fromRGBO(58, 15, 18, 1),
            border: Color.fromRGBO(58, 15, 18, 1),
            text: Color.fromRGBO(255, 222, 224, 1),
            accent: Color.fromRGBO(255, 131, 140, 1),
          ),
        ),
      );
}
