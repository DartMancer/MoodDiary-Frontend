import 'package:flutter/material.dart';
import 'package:mood_diary/pages/note_screen/view/view.dart';

import 'note_content.dart';
import 'note_title.dart';

class NoteSection extends StatelessWidget {
  const NoteSection({
    super.key,
    required this.widget,
  });

  final NoteScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NoteTitle(),
        NoteContent(widget: widget),
      ],
    );
  }
}
