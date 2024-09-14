import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/pages/note_screen/view/view.dart';

class NoteContent extends StatelessWidget {
  const NoteContent({
    super.key,
    required this.widget,
  });

  final NoteScreen widget;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Container(
      width: width * 0.9,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03333,
        vertical: width * 0.03333,
      ),
      decoration: BoxDecoration(
        color: whiteClr,
        borderRadius: BorderRadius.circular(width * 0.034667),
        boxShadow: StyleComponents().boxShadow(context: context),
      ),
      child: ExpandableText(
        widget.noteContent.dayNote,
        expandText: 'ещё',
        collapseText: 'скрыть',
        maxLines: 5,
        linkColor: mainClr,
        style: TextStyle(
          color: blackClr,
          fontFamily: fontApp,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
