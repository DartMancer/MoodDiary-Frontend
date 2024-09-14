import 'package:hive_flutter/hive_flutter.dart';

part 'mood_note.g.dart';

@HiveType(typeId: 0)
class MoodNote extends HiveObject {
  MoodNote({
    required this.mainEmotion,
    required this.emotionDetails,
    required this.stressLevel,
    required this.selfAssessment,
    required this.dayNote,
    required this.currentDate,
  });

  @HiveField(0)
  final int mainEmotion;
  @HiveField(1)
  final List<int> emotionDetails;
  @HiveField(2)
  final double stressLevel;
  @HiveField(3)
  final double selfAssessment;
  @HiveField(4)
  final String dayNote;
  @HiveField(5)
  final DateTime currentDate;
}
