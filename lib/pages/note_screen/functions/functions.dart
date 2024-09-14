import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class NoteScreenFunctions {
  void showDeleteDialog({
    required BuildContext context,
    required String title,
    required String content,
    required Function deleteFunction,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundLightClr,
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: blackClr, fontFamily: fontApp),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(color: greyClr1, fontFamily: fontApp),
          ),
          actions: [
            TextButton(
              child: Text(
                'Да',
                style: TextStyle(color: mainClr, fontFamily: fontApp),
              ),
              onPressed: () {
                deleteFunction();
                Navigator.of(context).pop(); // Закрытие pop-up
              },
            ),
            TextButton(
              child: Text(
                'Нет',
                style: TextStyle(color: mainClr, fontFamily: fontApp),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Закрытие pop-up
              },
            ),
          ],
        );
      },
    );
  }
}
