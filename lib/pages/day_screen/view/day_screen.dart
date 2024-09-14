import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

import 'view.dart';

enum MainSwitcher { diary, stats }

@RoutePage()
class DayScreen extends StatefulWidget {
  const DayScreen({super.key});

  @override
  State<DayScreen> createState() => _DayScreenState();
}

TextEditingController notesController = TextEditingController();

MainSwitcher mainSwitcher = MainSwitcher.diary;
int selectedEmotion = -1;
List<int> emotionDetailSelected = [];

Map<String, List> _emotionsList = {
  'Радость': ['assets/images/Happy.png', happyWords],
  'Страх': ['assets/images/Fear.png', fearWords],
  'Бешенство': ['assets/images/Angry.png', angryWords],
  'Грусть': ['assets/images/Sadness.png', sadnessWords],
  'Спокойствие': ['assets/images/Calmness.png', calmnessWords],
  'Сила': ['assets/images/Strong.png', stronghWords],
};
double stressLevel = 3.0;
double selfAssessment = 3.0;

class _DayScreenState extends State<DayScreen> {
  bool isNotesFilled = false;

  @override
  void initState() {
    notesController.addListener(() => notesListener());
    super.initState();
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    final DateTime dateTime = DateTime.now();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05333),
            child: Column(
              children: [
                Header(
                  isDiary: mainSwitcher == MainSwitcher.diary,
                  dateTime: dateTime,
                ),
                SwitchPanel(
                  isDiary: mainSwitcher == MainSwitcher.diary,
                  setDiaryType: _setDiaryType,
                  setStatsType: _setStatsType,
                ), // Header: Panel for switching between the Mood diary and Statistics
                AnimatedCrossFade(
                  firstChild: MoodDiaryBody(
                    emotionsList: _emotionsList,
                    selectedEmotion: selectedEmotion,
                    emotionDetailSelected: emotionDetailSelected,
                    notesController: notesController,
                    stressLevel: stressLevel,
                    selfAssessment: selfAssessment,
                    isNotesFilled: isNotesFilled,
                    dateTime: dateTime,
                    chooseMainEmotion: _chooseMainEmotion,
                    emotionDetailSelect: _emotionDetailSelect,
                    setStressLevel: _setStressLevel,
                    setSelfAssessment: _setSelfAssessment,
                    resetScreen: _resetScreen,
                  ),
                  secondChild: StatsBody(emotionsList: _emotionsList),
                  crossFadeState: mainSwitcher == MainSwitcher.diary
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400),
                  sizeCurve: Curves.easeInCubic,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _chooseMainEmotion({required int index}) {
    selectedEmotion == index
        ? setState(() => selectedEmotion = -1)
        : setState(() => selectedEmotion = index);
    emotionDetailSelected.clear();
  }

  void _setDiaryType() {
    setState(() => mainSwitcher = MainSwitcher.diary);
  }

  void _setStatsType() {
    setState(() => mainSwitcher = MainSwitcher.stats);
  }

  void _emotionDetailSelect({required int emotionDetailIndex}) {
    emotionDetailSelected.contains(emotionDetailIndex)
        ? setState(() => emotionDetailSelected.remove(emotionDetailIndex))
        : setState(() => emotionDetailSelected.add(emotionDetailIndex));
  }

  void _setStressLevel({required double value}) {
    setState(() => stressLevel = value);
  }

  void _setSelfAssessment({required double value}) {
    setState(() => selfAssessment = value);
  }

  void notesListener() {
    final isNotesFilled = notesController.text.isEmpty;
    setState(() => this.isNotesFilled = !isNotesFilled);
  }

  void _resetScreen() {
    setState(() {
      selectedEmotion = -1;
      emotionDetailSelected = [];
      stressLevel = 3.0;
      selfAssessment = 3.0;
      notesController.text = '';
    });
  }
}
