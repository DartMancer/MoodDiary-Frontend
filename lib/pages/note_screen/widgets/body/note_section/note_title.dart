import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.9,
      height: width * 0.08,
      child: ASText(
        text: 'Ваша заметка',
        color: blackClr,
        textAlign: TextAlign.start,
      ),
    );
  }
}
