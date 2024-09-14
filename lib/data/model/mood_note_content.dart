class MoodNoteContent {
  MoodNoteContent({
    required this.index,
    required this.mainEmotion,
    required this.mainEmotionImage,
    required this.emotionDetails,
    required this.stressLevel,
    required this.selfAssessment,
    required this.dayNote,
    required this.currentDate,
  });

  final int index;
  final String mainEmotion;
  final String mainEmotionImage;
  final List<String> emotionDetails;
  final double stressLevel;
  final double selfAssessment;
  final String dayNote;
  final String currentDate;
}
