import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/pages/note_screen/view/view.dart';

class MainEmotionSection extends StatelessWidget {
  const MainEmotionSection({
    super.key,
    required this.widget,
  });

  final NoteScreen widget;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Column(
      children: [
        Image.asset(
          widget.noteContent.mainEmotionImage,
          width: width * 0.5,
        ),
        SizedBox(
          width: width * 0.7,
          height: width * 0.08,
          child: ASText(
            text: widget.noteContent.mainEmotion,
            color: blackClr,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
