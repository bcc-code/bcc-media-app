import 'dart:ui';

import 'package:bccm_core/design_system.dart';

class BccMediaColors extends DesignSystemColors {
  static const _messageText = Color(0xffFEFEFE);
  static const _messageInfo = Color(0xff6EB0E6);
  static const _messageWarning = Color(0xffF2AE00);
  static const _messageError = Color(0xffE63C62);

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
          info: MessageColors(background: Color.fromRGBO(110, 176, 230, 0.12), border: _messageInfo, text: _messageText, accent: _messageInfo),
          warning: MessageColors(background: Color.fromRGBO(242, 174, 0, 0.12), border: _messageWarning, text: _messageText, accent: _messageWarning),
          error: MessageColors(background: Color.fromRGBO(230, 60, 98, 0.12), border: _messageError, text: _messageText, accent: _messageError),
        ),
      );
}
