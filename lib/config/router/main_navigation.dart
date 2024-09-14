import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mood_diary/data/model/mood_note_content.dart';
import 'package:mood_diary/pages/calendar_screen/view/calendar_screen.dart';
import 'package:mood_diary/pages/day_screen/view/day_screen.dart';
import 'package:mood_diary/pages/note_screen/view/note_screen.dart';

part 'main_navigation.gr.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: DayRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          durationInMilliseconds: 300,
          reverseDurationInMilliseconds: 150,
        ),
        CustomRoute(
          page: CalendarRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
          reverseDurationInMilliseconds: 150,
        ),
        CustomRoute(
          page: NoteRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: 300,
          reverseDurationInMilliseconds: 150,
        ),
      ];
}
