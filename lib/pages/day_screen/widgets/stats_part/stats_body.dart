import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';
import 'package:mood_diary/pages/day_screen/day_screen.dart';

class StatsBody extends StatelessWidget {
  const StatsBody({
    super.key,
    required this.emotionsList,
  });

  final Map<String, List<dynamic>> emotionsList;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    return ValueListenableBuilder(
      valueListenable: Hive.box<MoodNote>(moodNoteBox).listenable(),
      builder: (context, Box<MoodNote> box, _) {
        if (box.values.isEmpty) {
          return const EmptyStatsBody();
        } else {
          return Column(
            children: [
              StatsMainCard(
                box: box,
                emotionsList: emotionsList,
              ),
              SizedBox(
                height: height - width * 0.70267,
                child: ListView.builder(
                  reverse: true,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    MoodNote? mood = box.getAt(index);
                    MoodNoteContent moodContent =
                        DayScreenFunctions().getNoteContent(
                      index: index,
                      mood: mood!,
                      emotionsList: emotionsList,
                    );

                    return StatsCard(
                      moodContent: moodContent,
                      index: index,
                      box: box,
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
