import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';

import 'package:mood_diary/pages/calendar_screen/widgets/widgets.dart';

import 'view.dart';

@RoutePage()
class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
    required this.noteContent,
  });

  final MoodNoteContent noteContent;

  @override
  State<NoteScreen> createState() => _DayScreenState();
}

TextEditingController notesController = TextEditingController();

class _DayScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundLightClr,
        leading: const CloseButtonWidget(),
        actions: [DeleteButton(deleteNote: _deleteNote)],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScreenTitle(widget: widget),
              MainEmotionSection(widget: widget),
              const CustomDivider(),
              EmotionsDetailListView(
                emotionsValues: widget.noteContent.emotionDetails,
              ),
              const CustomDivider(),
              NumbersIndicators(widget: widget),
              const CustomDivider(),
              NoteSection(widget: widget),
              SizedBox(height: width * 0.3),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteNote() {
    try {
      Hive.box<MoodNote>(moodNoteBox).deleteAt(widget.noteContent.index);
      Navigator.of(context).pop();
    } catch (e, st) {
      Logger().handle(e, st);
    }
  }
}
