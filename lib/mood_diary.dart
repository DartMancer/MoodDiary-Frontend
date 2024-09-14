import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary/config/config.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MoodDiary extends StatefulWidget {
  const MoodDiary({super.key});

  @override
  State<MoodDiary> createState() => _MainAppState();
}

class _MainAppState extends State<MoodDiary> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => CustomThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<CustomThemeProvider>(context);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'MoodDiary',
            localizationsDelegates: const [
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ru', 'RU'), // Russia
            ],
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            routerConfig: GetIt.I<AppRouter>().config(
              deepLinkBuilder: (deepLink) async {
                return DeepLink.single(const DayRoute());
              },
              navigatorObservers: () => [
                TalkerRouteObserver(GetIt.I<Talker>()),
              ],
            ),
          );
        },
      );
}
