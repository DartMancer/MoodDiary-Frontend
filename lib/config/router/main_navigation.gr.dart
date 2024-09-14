// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'main_navigation.dart';

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalendarScreen();
    },
  );
}

/// generated route for
/// [DayScreen]
class DayRoute extends PageRouteInfo<void> {
  const DayRoute({List<PageRouteInfo>? children})
      : super(
          DayRoute.name,
          initialChildren: children,
        );

  static const String name = 'DayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DayScreen();
    },
  );
}

/// generated route for
/// [NoteScreen]
class NoteRoute extends PageRouteInfo<NoteRouteArgs> {
  NoteRoute({
    Key? key,
    required MoodNoteContent noteContent,
    List<PageRouteInfo>? children,
  }) : super(
          NoteRoute.name,
          args: NoteRouteArgs(
            key: key,
            noteContent: noteContent,
          ),
          initialChildren: children,
        );

  static const String name = 'NoteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteRouteArgs>();
      return NoteScreen(
        key: args.key,
        noteContent: args.noteContent,
      );
    },
  );
}

class NoteRouteArgs {
  const NoteRouteArgs({
    this.key,
    required this.noteContent,
  });

  final Key? key;

  final MoodNoteContent noteContent;

  @override
  String toString() {
    return 'NoteRouteArgs{key: $key, noteContent: $noteContent}';
  }
}
