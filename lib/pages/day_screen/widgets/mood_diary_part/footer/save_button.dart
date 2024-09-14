import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/mood_note.dart';
import 'package:mood_diary/pages/day_screen/functions/functions.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.isNotesFilled,
    required this.selectedEmotion,
    required this.emotionDetailSelected,
    required this.stressLevel,
    required this.selfAssessment,
    required this.dayNote,
    required this.currentDateTime,
    required this.resetScreen,
  });

  final bool isNotesFilled;
  final int selectedEmotion;
  final List<int> emotionDetailSelected;
  final double stressLevel, selfAssessment;
  final String dayNote;
  final DateTime currentDateTime;
  final Function resetScreen;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.09333),
      child: AnimatedContainer(
        width: width,
        height: width * 0.11733,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          color: selectedEmotion != -1 &&
                  emotionDetailSelected.isNotEmpty &&
                  isNotesFilled
              ? mainClr
              : greyClr4,
          borderRadius: BorderRadius.circular(width * 0.184),
        ),
        child: MaterialButton(
          onPressed: selectedEmotion != -1 &&
                  emotionDetailSelected.isNotEmpty &&
                  isNotesFilled
              ? () {
                  MoodNote moodNote = MoodNote(
                    mainEmotion: selectedEmotion,
                    emotionDetails: emotionDetailSelected,
                    stressLevel: stressLevel,
                    selfAssessment: selfAssessment,
                    dayNote: dayNote,
                    currentDate: currentDateTime,
                  );
                  try {
                    Hive.box<MoodNote>(moodNoteBox).put(
                      currentDateTime.toString(),
                      moodNote,
                    );
                    DayScreenFunctions().showPopUpDialog(
                      context: context,
                      title: 'Успех',
                      content: 'Данные успешно сохранены!',
                    );
                    resetScreen();
                  } on Exception catch (e, st) {
                    DayScreenFunctions().showPopUpDialog(
                      context: context,
                      title: 'Упс...',
                      content: 'Что-то пошло не так, попробуйте снова',
                    );
                    Logger().handle(e, st);
                  }
                }
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.184),
          ),
          child: SizedBox(
            height: width * 0.0733,
            child: ASText(
              text: 'Сохранить',
              color: selectedEmotion != -1 &&
                      emotionDetailSelected.isNotEmpty &&
                      isNotesFilled
                  ? whiteClr
                  : greyClr2,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
