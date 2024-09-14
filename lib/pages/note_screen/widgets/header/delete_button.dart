import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/pages/note_screen/functions/functions.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.deleteNote,
  });

  final Function deleteNote;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return IconButton(
      onPressed: () {
        NoteScreenFunctions().showDeleteDialog(
          context: context,
          title: 'Удаление',
          content: 'Вы точно хотите удалить все свои заметки?',
          deleteFunction: deleteNote,
        );
      },
      icon: Icon(
        MoodDiaryIcons.trashIcon,
        size: width * 0.062667,
        color: greyClr1,
      ),
    );
  }
}
