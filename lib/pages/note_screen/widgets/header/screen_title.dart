import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/pages/note_screen/view/view.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    super.key,
    required this.widget,
  });

  final NoteScreen widget;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.7,
      height: width * 0.1,
      child: ASText(
        text: 'Заметка от: ${widget.noteContent.currentDate}',
        color: greyClr1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
