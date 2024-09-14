import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:mood_diary/core/core.dart';
import 'package:talker_flutter/talker_flutter.dart';

class ASText extends StatelessWidget {
  const ASText({
    super.key,
    required this.text,
    required this.color,
    required this.textAlign,
    this.overflowReplacement,
    this.overflow,
    this.textStyle,
    this.fontWeight,
  });

  final String text;
  final Color color;
  final TextAlign textAlign;
  final Widget? overflowReplacement;
  final TextOverflow? overflow;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      overflow: overflow,
      overflowReplacement: overflowReplacement,
      style: textStyle ??
          TextStyle(
            fontSize: 70,
            color: color,
            fontFamily: fontApp,
            fontWeight: fontWeight ?? FontWeight.bold,
            decoration: TextDecoration.none,
          ),
    );
  }
}

class Logger {
  var talker = GetIt.I<Talker>();

  void info(dynamic message) {
    talker.info(message);
  }

  void handle(dynamic e, dynamic st) {
    talker.handle(e, st);
  }

  void debug(dynamic message) {
    talker.debug(message);
  }

  void critical(dynamic message) {
    talker.critical(message);
  }
}
