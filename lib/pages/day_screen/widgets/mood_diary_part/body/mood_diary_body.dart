import 'package:flutter/material.dart';
import 'package:mood_diary/pages/day_screen/day_screen.dart';
import 'emotions_list/emotion_listview.dart';
import 'notes_textfield.dart';
import 'section_lable.dart';
import 'slider_template/slider_template.dart';

class MoodDiaryBody extends StatelessWidget {
  const MoodDiaryBody({
    super.key,
    required this.emotionsList,
    required this.selectedEmotion,
    required this.emotionDetailSelected,
    required this.stressLevel,
    required this.selfAssessment,
    required this.notesController,
    required this.isNotesFilled,
    required this.dateTime,
    required this.chooseMainEmotion,
    required this.emotionDetailSelect,
    required this.setStressLevel,
    required this.setSelfAssessment,
    required this.resetScreen,
  });

  final Map<String, List<dynamic>> emotionsList;
  final int selectedEmotion;
  final List<int> emotionDetailSelected;
  final TextEditingController notesController;
  final double stressLevel, selfAssessment;
  final bool isNotesFilled;
  final DateTime dateTime;
  final Function chooseMainEmotion,
      emotionDetailSelect,
      setStressLevel,
      setSelfAssessment,
      resetScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionLabel(label: 'Что чувствуешь?'),
        EmotionsListview(
          emotionsList: emotionsList,
          selectedEmotion: selectedEmotion,
          emotionDetailSelected: emotionDetailSelected,
          chooseMainEmotion: chooseMainEmotion,
          emotionDetailSelect: emotionDetailSelect,
        ),
        const SectionLabel(label: 'Уровень стресса'),
        SliderTemplate(
          leftTitle: 'Низкий',
          rightTitle: 'Высокий',
          saveSliderValue: setStressLevel,
        ),
        const SectionLabel(label: 'Самооценка'),
        SliderTemplate(
          leftTitle: 'Неуверенность',
          rightTitle: 'Уверенность',
          saveSliderValue: setSelfAssessment,
        ),
        const SectionLabel(label: 'Заметки'),
        NoteTextfield(controller: notesController),
        SaveButton(
          isNotesFilled: isNotesFilled,
          selectedEmotion: selectedEmotion,
          emotionDetailSelected: emotionDetailSelected,
          stressLevel: stressLevel,
          selfAssessment: selfAssessment,
          dayNote: notesController.text,
          currentDateTime: dateTime,
          resetScreen: resetScreen,
        ),
      ],
    );
  }
}
