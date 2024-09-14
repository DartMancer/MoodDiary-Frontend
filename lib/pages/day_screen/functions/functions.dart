import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';

class DayScreenFunctions {
  String formatDate({required DateTime dateTime}) {
    String formattedDate = DateFormat('dd MMMM HH:mm', 'ru').format(dateTime);
    return formattedDate;
  }

  MoodNoteContent getNoteContent({
    required MoodNote mood,
    required int index,
    required Map<String, List> emotionsList,
  }) {
    List<String> listDetail = [];
    for (var i = 0; i < emotionsList.values.toList()[0][1].length; i++) {
      if (mood.emotionDetails.contains(i)) {
        listDetail.add(emotionsList.values.toList()[0][1][i]);
      }
    }
    String currentDate = DayScreenFunctions().formatDate(
      dateTime: mood.currentDate,
    );

    MoodNoteContent moodNoteContent = MoodNoteContent(
      index: index,
      mainEmotion: emotionsList.keys.toList()[mood.mainEmotion],
      mainEmotionImage: emotionsList.values.toList()[mood.mainEmotion].first,
      emotionDetails: listDetail,
      stressLevel: mood.stressLevel,
      selfAssessment: mood.selfAssessment,
      dayNote: mood.dayNote,
      currentDate: currentDate,
    );
    return moodNoteContent;
  }

  void showPopUpDialog({
    required BuildContext context,
    required String title,
    required String content,
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
                'ОК',
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

  List<String> topEmotion({
    required Box<MoodNote> box,
    required Map<String, List> emotionsList,
  }) {
    // ignore: no_leading_underscores_for_local_identifiers
    List<int> _emotionsList = [];

    for (var i = 0; i < box.values.length; i++) {
      _emotionsList.add(box.values.toList()[i].mainEmotion);
    }

    Map<int, int> frequencyMap = {};

    for (int number in _emotionsList) {
      if (frequencyMap.containsKey(number)) {
        frequencyMap[number] = frequencyMap[number]! + 1;
      } else {
        frequencyMap[number] = 1;
      }
    }
    int mostFrequent = _emotionsList[0];
    int maxCount = 0;

    frequencyMap.forEach((number, count) {
      if (count > maxCount) {
        maxCount = count;
        mostFrequent = number;
      }
    });

    String titleCard = emotionsList.keys.toList()[mostFrequent];
    String imageCard = emotionsList.values.toList()[mostFrequent].first;

    return [titleCard, imageCard];
  }

  String averageStats({required Box<MoodNote> box, required bool isStress}) {
    double sum = 0;
    for (var i = 0; i < box.values.length; i++) {
      sum += isStress
          ? box.values.toList()[i].stressLevel
          : box.values.toList()[i].selfAssessment;
    }

    String avrg = (sum / box.values.length).toStringAsFixed(1);

    return avrg;
  }
}
