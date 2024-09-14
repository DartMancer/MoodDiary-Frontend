import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:mood_diary/config/config.dart';
import 'package:mood_diary/core/core.dart';
import 'package:mood_diary/data/model/model.dart';

import 'stats_card_content.dart';
import 'stats_card_time_reg.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.moodContent,
    required this.index,
    required this.box,
  });

  final MoodNoteContent moodContent;
  final int index;
  final Box<MoodNote> box;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        try {
          box.deleteAt(index);
        } catch (e, st) {
          Logger().handle(e, st);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: width * 0.06333,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.02333),
              child: Stack(
                children: [
                  Container(
                    height: width * 0.23533,
                    decoration: BoxDecoration(
                      color: whiteClr,
                      borderRadius: BorderRadius.circular(width * 0.034667),
                      boxShadow: StyleComponents().boxShadow(context: context),
                    ),
                    child: StatsCardContent(moodContent: moodContent),
                  ),
                  SizedBox(
                    width: width,
                    height: width * 0.23533,
                    child: MaterialButton(
                      onPressed: () {
                        GetIt.I<AppRouter>().push(
                          NoteRoute(
                            noteContent: moodContent,
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.034667),
                      ),
                    ),
                  )
                ],
              ),
            ),
            StatsCardTimeReg(moodContent: moodContent),
          ],
        ),
      ),
    );
  }
}
